/*********************************************************************
	cs2ParticleBase.h
					パーティクルプラグイン 基底クラス
**********************************************************************/
#pragma once

#include <windows.h>

#define CS2PARTICLEVERSION	(0x00020001)
#define	PLUGINTYPE	1

#define PI		(3.1415926535897932f)


class ParticlePluginFunc;
class ParticlePluginFunc21;

class cs2ParticleBase
{
public:
	// 初期化パラメータ
	typedef struct
	{
		DWORD	count;		// パーティクル数
		float	screen_width;	// 画面の幅
		float	screen_height;	// 画面の高さ
		float	width;		// パーティクル画像の幅
		float	height;		// パーティクル画像の高さ
		float	param[32];	// 入力パラメータ

	} INITPARAM, *LPINITPARAM;

	// 実行パラメータ
	typedef struct
	{
		DWORD	count;	// パーティクル数
		float	screen_width;	// 画面の幅
		float	screen_height;	// 画面の高さ
		float	width;		// パーティクル画像の幅
		float	height;		// パーティクル画像の高さ
		float	param[32];	// 入力パラメータ

	} EXECPARAM, *LPEXECPARAM;

	// 終了（停止）パラメータ
	typedef struct
	{
		DWORD	count;	// パーティクル数
		float	screen_width;	// 画面の幅
		float	screen_height;	// 画面の高さ
		float	width;		// パーティクル画像の幅
		float	height;		// パーティクル画像の高さ
		float	param[32];	// 入力パラメータ

	} STOPPARAM, *LPSTOPPARAM;

	// ３次ベクトル
	typedef union
	{
		struct
		{
			float	x, y, z;
		};
		float vec[3];
	} VEC3, *LPVEC3;

	// ２次ベクトル
	typedef union
	{
		struct
		{
			float	x, y;
		};
		struct
		{
			float	u, v;
		};
		float vec[2];
	} VEC2, *LPVEC2;

	// 色情報
	typedef union
	{
		struct
		{
			BYTE	r, g, b, a;
		};
		DWORD	color;
	} COLOR, *LPCOLOR;

	// 頂点情報
	typedef struct
	{
		VEC3	v;
		COLOR	col;
		VEC2	tx;
	} VERTEX, *LPVERTEX;

	// パーティクル情報
	typedef struct
	{
		VERTEX	p[4];
		VEC3	base;
		VEC3	pos;
		VEC3	rot;
		VEC3	scale;
		BOOL	disp;
	} PARTICLE, *LPPARTICLE;

	// ブレンドモード
	typedef enum
	{
		BM_NORM,	// 通常モード
		BM_ADD1,	// 加算合成1
		BM_ADD2,	// 加算合成2
		BM_MUL,		// 乗算合成
		BM_INV,		// 転送先カラー反転
		BM_DBL		// 転送先カラー２倍
	} BLENDMODE;


protected:
	void* _P;

public:
	cs2ParticleBase( void* p );
	virtual ~cs2ParticleBase( );

	virtual void Init( LPINITPARAM p ) = NULL;
	virtual void Exec( LPEXECPARAM p, DWORD before, DWORD frame ) = NULL;
	virtual void Stop( LPSTOPPARAM p ) = NULL;

public:
	ParticlePluginFunc21*	PPF;

	LPPARTICLE	lpParticle;
	BLENDMODE	BlendMode;

	LONG		nAttachPL;
	VEC3		vAttachPLBase;
	VEC3		vAttachPLPos;
	BOOL		bAttachPLDisp;
};


////////////////////////////////////////
// Ver 2.0 ～
class ParticlePluginFunc
{
private:

public:
	ParticlePluginFunc( );

	// 全般系
	virtual void GetScreenSize( void* p, DWORD* width, DWORD* height );	// スクリーンの幅と高さを取得
	virtual void Exit( void* p );

	// 乱数
	virtual DWORD rand( void );		// 整数値取得 (0～0xffffffff)
	virtual float frand( void );	// 少数値取得 (0.0～1.0)

	// 度⇔ラジアン変換
	virtual float Deg2Rad( float d );	// 度→ラジアン
	virtual float Rad2Deg( float r );	// ラジアン→度

	// 算術関数
	virtual float sin( float r );
	virtual float cos( float r );
	virtual float tan( float r );
	virtual float asin( float r );
	virtual float acos( float r );
	virtual float atan( float r );
	virtual float atan2( float y, float x );
	virtual float ceil( float f );
	virtual float fabs( float f );
	virtual float floor( float f );
	virtual float fmod( float a, float b );
	virtual float sqrt( float f );
	virtual float pow( float a, float b );
	virtual long abs( long n );
	virtual long round( float f );


	// ベクトル関数
	virtual void VecRotateX( cs2ParticleBase::LPVEC3 v, float r );
	virtual void VecRotateY( cs2ParticleBase::LPVEC3 v, float r );
	virtual void VecRotateZ( cs2ParticleBase::LPVEC3 v, float r );
	virtual void VecRotateXYZ( cs2ParticleBase::LPVEC3 v, float r );
	virtual void VecTrans( cs2ParticleBase::LPVEC3 v, float x, float y, float z );
	virtual void VecScale( cs2ParticleBase::LPVEC3 v, float x, float y, float z );
	virtual float VecGetDistance( cs2ParticleBase::LPVEC3 v1, cs2ParticleBase::LPVEC3 v2 );
	virtual void VecNormalize( cs2ParticleBase::LPVEC3 v );

	// その他
	virtual float LinearInt( float area_min, float area_max, float in_min, float in_max, float n );
	virtual float TriWave( float n, float r );

};


////////////////////////////////////////
// Ver 2.1 ～
class ParticlePluginFunc21 : public ParticlePluginFunc
{
public:
	virtual VOID SetZShift( void* __lpp, INT no, FLOAT zs );
};



