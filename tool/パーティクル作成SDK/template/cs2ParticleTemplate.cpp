/*********************************************************************
	cs2ParticleTemplate.cpp
			パーティクルプラグインテンプレート


**********************************************************************/

#include "cs2ParticleTemplate.h"


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

}


/********************************************
Public Function		~cs2Particle
	デストラクタ
input  :
output :
*********************************************/
cs2Particle::~cs2Particle( )
{

}


/********************************************
Public Function		Init
	初期化
input  :	LPINITPARAM	p	初期化パラメータ
output :
*********************************************/
void cs2Particle::Init( LPINITPARAM p )
{

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
