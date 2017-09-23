/*********************************************************************
	Rain.h
			パーティクルプラグイン  紙吹雪01
**********************************************************************/
#pragma once

#include "../cs2ParticleBase.h"


class cs2Particle : public cs2ParticleBase
{

public:
	cs2Particle( void* p );
	~cs2Particle( );

	virtual VOID Init( LPINITPARAM p );
	virtual VOID Exec( LPEXECPARAM p, DWORD before, DWORD frame );
	virtual VOID Stop( LPSTOPPARAM p );

	// ポジションリセット
	void ResetPos( long no, float w, float h, float tx, float ty );

	// 移動ベクトル取得
	VEC3 cs2Particle::SetDir( long no, float spd, float r1, float r2 );

private:
	// 移動ベクトル
	LPVEC3	lpDir;
};


