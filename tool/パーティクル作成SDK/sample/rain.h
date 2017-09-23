/*********************************************************************
	Rain.h
			�p�[�e�B�N���v���O�C��  ������01
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

	// �|�W�V�������Z�b�g
	void ResetPos( long no, float w, float h, float tx, float ty );

	// �ړ��x�N�g���擾
	VEC3 cs2Particle::SetDir( long no, float spd, float r1, float r2 );

private:
	// �ړ��x�N�g��
	LPVEC3	lpDir;
};


