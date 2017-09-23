/*********************************************************************
	cs2ParticleTemplate.h
			�p�[�e�B�N���v���O�C���e���v���[�g
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
};


