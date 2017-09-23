/*********************************************************************
	Rain.cpp
			パーティクルプラグイン
			雨

	param
		0 : スピード
		1 : 角度1
		2 : 角度2

	落下角度は角度1から角度2の間になります。

	ex
	particle3 0 rain pt_rain 500 10000 31 50 -5 5
	
**********************************************************************/

#include "Rain.h"

#define	SAFE_FREE( p )	if(p!=NULL){ free(p); p=NULL; }


/********************************************
Global Function		MakeInstance
	インスタンス作成
input  : void*	p
output : cs2ParticleTemplate*	プラグインオブジェクト
*********************************************/
__declspec(dllexport) cs2Particle* MakeInstance( void* p )
{
	return new cs2Particle( p );
}


/********************************************
Public Function		cs2Particle
	コンストラクタ
input  :
output :
*********************************************/
cs2Particle::cs2Particle( void* p ) : cs2ParticleBase( p )
{
	lpDir = NULL;
}


/********************************************
Public Function		~cs2Particle
	デストラクタ
input  :
output :
*********************************************/
cs2Particle::~cs2Particle( )
{
	if( lpDir != NULL )
	{
		free( lpDir );
		lpDir = NULL;
	}
}


/********************************************
Public Function		Init
	初期化
input  :	LPINITPARAM	p	初期化パラメータ
output :
*********************************************/
void cs2Particle::Init( LPINITPARAM p )
{
	float* reg = p->param;

	if( lpDir == NULL )
	{
		// メモリが確保されていない場合は確保
		lpDir = (LPVEC3)malloc( p->count * sizeof(VEC3) );
	}

	if( lpDir != NULL )
	{
		for( DWORD i = 0; i < p->count; i++ )
		{
			// 初期位置の設定
			ResetPos( i, p->screen_width, p->screen_height, p->width, p->height );
			SetDir( i, reg[0], PPF->Deg2Rad(reg[1]), PPF->Deg2Rad(reg[2]) );
		}
	}
}


/********************************************
Public Function		Exec
	実行
input  :	LPEXECPARAM	p		実行パラメータ
			DWORD		before	前回実行時のフレーム値
			DWORD		frame	フレーム値
output :
*********************************************/
void cs2Particle::Exec( LPEXECPARAM p, DWORD before, DWORD frame )
{
	float	f;
	float*	reg;

	if( lpDir != NULL )
	{
		f = (float)(frame - before);
		reg = p->param;
		
		for( DWORD i = 0; i < p->count; i++ )
		{
			lpParticle[i].pos.x += lpDir[i].x * f;
			lpParticle[i].pos.y += lpDir[i].y * f;
			lpParticle[i].pos.z += lpDir[i].z * f;

			if( lpParticle[i].pos.y > p->screen_height + 200.f )
			{
				// 下まで落ちたので、再度位置を初期化
				ResetPos( i, p->screen_width, p->screen_height, p->width, p->height );
				SetDir( i, reg[0], PPF->Deg2Rad(reg[1]), PPF->Deg2Rad(reg[2]) );
			}
		}
	}
}


/********************************************
Public Function		Stop
	停止
input  :	LPSTOPPARAM	p	停止パラメータ
output :
*********************************************/
void cs2Particle::Stop( LPSTOPPARAM p )
{

}


/********************************************
Private Function		ResetPos
	パーティクル位置を初期化
input  :	long	no	初期化するパーティクルNo
			float	w	スクリーンの幅
			float	h	スクリーンの高さ
			float	tx	パーティクル画像の幅
			float	ty	パーティクル画像の高さ
output :
*********************************************/
void cs2Particle::ResetPos( long no, float w, float h, float tx, float ty )
{
	lpParticle[no].pos.x = PPF->frand( ) * w * 2.f - w * 0.5f;
	lpParticle[no].pos.y = -(PPF->frand( ) * h * 2.f);

	lpParticle[no].base.x = tx * 0.5f;
	lpParticle[no].base.y = ty * 0.5f;
}


/********************************************
Private Function		SetDir
	パーティクル移動方向をセット
input  :	long	no		パーティクルNo
			float	spd		スピード(パラメータ0)
			float	r1		角度1（パラメータ1）
			float	r2		角度2（パラメータ2）
output :	VEC3	移動ベクトル
*********************************************/
cs2Particle::VEC3 cs2Particle::SetDir( long no, float spd, float r1, float r2 )
{
	VEC3 v;
	float r;

	v.x = 0.f;
	v.y = spd;
	v.z = 0.f;

	r = PPF->frand( ) * (r2 - r1) + r1;
	PPF->VecRotateZ( &v, r );
	lpDir[no] = v;

	lpParticle[no].rot.z = -r;

	return v;
}
