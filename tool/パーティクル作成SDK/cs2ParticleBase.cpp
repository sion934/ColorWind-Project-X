/*********************************************************************
	cs2ParticleBase.cpp
					パーティクルプラグイン 基底クラス
**********************************************************************/

#include "cs2ParticleBase.h"


ParticlePluginFunc*	PPF = NULL;


/********************************************
Public Function		ReleaseInstance
	インスタンス開放
input  : cs2ParticleBase*	c	プラグインオブジェクト
output :
*********************************************/
__declspec(dllexport) void ReleaseInstance( cs2ParticleBase* c )
{
	if( c != NULL )	delete c;
}


/********************************************
Public Function		GetPluginVersion
	プラグインバージョン取得
input  : 
output : DWORD	バージョンNo
*********************************************/
__declspec(dllexport) DWORD GetPluginVersion( void )
{
	return CS2PARTICLEVERSION;
}


/********************************************
Public Function		GetPluginType
	プラグインタイプ取得
input  : 
output : DWORD	タイプNo
*********************************************/
__declspec(dllexport) DWORD GetPluginType( void )
{
	return PLUGINTYPE;
}



/********************************************
Public Function		cs2ParticleBase
	コンストラクタ
input  :	void* p
output :
*********************************************/
cs2ParticleBase::cs2ParticleBase( void* p )
{
	_P = p;
	lpParticle = NULL;
	BlendMode = BM_NORM;
}


/********************************************
Public Function		~cs2ParticleBase
	デストラクタ
input  :
output :
*********************************************/
cs2ParticleBase::~cs2ParticleBase( )
{

}


