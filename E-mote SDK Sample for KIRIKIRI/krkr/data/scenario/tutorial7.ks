;;----------------------------------------------------------------------
;; �{�C�X�Ƃ̓���
;;----------------------------------------------------------------------
*start|�{�C�X�Ƃ̓���

[cm]

[emotestart seg=0 storage=emote_test_front.psb]

E-mote�ł́A�ϐ�[em]face_talk[endem]�ɒl���w�肵�āA���p�N�����炩�ɍs�킹�邱�Ƃ��o���܂��B
[p][er]

[emotevariable seg=0 name=face_talk value=5 time=200]
[emotewait seg=0]
[emotevariable seg=0 name=face_talk value=0 time=200]
[emotewait seg=0]
[emotevariable seg=0 name=face_talk value=5 time=200]
[emotewait seg=0]
[emotevariable seg=0 name=face_talk value=0 time=200]
[emotewait seg=0]

�ł����A�������Ɍ��p�N������������ł���̂͌����I�ł͂���܂����ˁB[l][r]
���炩�֗̕��Ȏ�i�͂Ȃ����̂��H[l][r]
�������A�p�ӂ��Ă���܂��I
[p][er]

E-mote�G�f�B�^��[em]�{�C�X�{�����[������͂���[endem]�Ƃ����@�\�ŁA�{�C�X�̉��ʂ���͂��āAE-mote�̕ϐ��Ɋ��蓖�Ă�̂ɂ��傤�ǂ������l�̈ꗗ�\������ďo�͂���@�\�������Ă��܂��B[l][r]
E-mote for KAG�ł́A���̉����{�����[����̓t�@�C����ǂݍ���ŁA�����I�ɕϐ��̒l���X�V���邱�Ƃ��o���܂��B
[p][er]

�ł́A���ۂɂ���Ă݂܂��傤�B
[p][er]

[seopt volume=25]

[begintag]
[[playse buf=0 storage=emote1.wav][r]
[[emotevariable seg=0 name=face_talk storage=emote1.vol.csv]
[endtag]

[playse buf=0 storage=emote1.wav]
[emotevariable seg=0 name=face_talk storage=emote1.vol.csv]
[ws]

�����ƃ{�C�X�ɍ��킹�Ă���炵�����p�N������܂����ˁB
[p][er]

�e�L�X�g�t�@�C������̕ϐ��w��ɂ́A emotevariable �^�O���g���܂��B[l][r]

[begintag]
[er]
[[playse buf=0 storage=emote1.wav][r]
[[emotevariable seg=0 name=face_talk [em]storage=emote1.vol.csv[endem]]
[endtag]

[em]storage[endem]�����Ńe�L�X�g�t�@�C���̃t�@�C�������w�肷�邱�ƂŁA�ϐ��̒l�����̃t�@�C������ǂݍ���Ŏ����I�ɍX�V���Ă���܂��B
[p][er]

�ł́A�����Ă��������̃{�C�X���Đ����Ă݂܂��傤�B
[p][er]

[begintag]
[er]
[[playse buf=0 storage=emote2.wav][r]
[[emotevariable seg=0 name=face_talk [em]storage=emote2.vol.csv[endem]]
[endtag]

[playse buf=0 storage=emote2.wav]
[emotevariable seg=0 name=face_talk storage=emote2.vol.csv]
[ws]

[p]

[begintag]
[er]
[[playse buf=0 storage=emote3.wav][r]
[[emotevariable seg=0 name=face_talk [em]storage=emote3.vol.csv[endem]]
[endtag]

[playse buf=0 storage=emote3.wav]
[emotevariable seg=0 name=face_talk storage=emote3.vol.csv]
[ws]

[p][cm]

�g���g���Ɍ������@�\�ł����A�Đ�����SE�o�b�t�@���璼�ڃ{�����[�����擾���Č��p�N�ɔ��f�����邱�Ƃ��o���܂��B[l][r]
�����Ă݂܂��傤�B
[p][er]

[begintag]
[er]
[[playse buf=0 storage=emote1.wav][r]
[[emotevariable seg=0 name=face_talk buf=0]
[endtag]

[playse buf=0 storage=emote1.wav]
[emotevariable seg=0 name=face_talk buf=0]
[ws]

���x�̓e�L�X�g���Q�Ƃ����ɁA����playse�Ŗ炵��SE�o�b�t�@�̃{�����[�����Q�Ƃ��Č��p�N���s���܂����B[l][r]

[begintag]
[er]
[[playse buf=0 storage=emote1.wav][r]
[[emotevariable seg=0 name=face_talk [em]buf=0[endem]]
[endtag]

[em]buf[endem]������SE�o�b�t�@�̔ԍ����w�肷�邱�ƂŁA�ϐ��̒l�����̃o�b�t�@����ǂݍ���Ŏ����I�ɍX�V���Ă���܂��B
[p][cm]

���̋@�\���g���ɂ́ASE�o�b�t�@�̉��ʂ��擾���邽�߁AgetSample.dll �������N���Ă����K�v������܂��B[l][r]

[begintag]
system/Override.tjs[r]
--[r]
Plugins.link("getSample.dll");[r]
[endtag]

KAG�̏������O�� dll �̃����N���������Ă��Ȃ��Ƃ����Ȃ����߁A���L�̂悤�� Override.tjs �Ńv���O�C�������[�h���Ă����܂��B
[p][cm]

���̃{�C�X���Abuf�w��Ō��p�N�������Ă݂܂��傤�B
[p][er]

[begintag]
[er]
[[playse buf=0 storage=emote2.wav][r]
[[emotevariable seg=0 name=face_talk [em]buf=0[endem]]
[endtag]

[playse buf=0 storage=emote2.wav]
[emotevariable seg=0 name=face_talk buf=0]
[ws]

[p]

[begintag]
[er]
[[playse buf=0 storage=emote3.wav][r]
[[emotevariable seg=0 name=face_talk [em]buf=0[endem]]
[endtag]

[playse buf=0 storage=emote3.wav]
[emotevariable seg=0 name=face_talk buf=0]
[ws]

[p][cm]

[em]storage[endem]�w���[em]buf[endem]�w��ł́A�v�Z�����قȂ邽�ߌ��p�N�̋����̏ڍׂ��قȂ�܂��B[l][r]
E-mote�G�f�B�^�Ń{�C�X����͂����e�L�X�g�𗘗p����ꍇ�A�ڍׂȉ�͂��s���̂Ŕ��Ɋ��炩�ȃA�j���[�V�����𐶐����܂��B[l][r]
�{�C�X��getSample.dll���A���^�C���ɉ�͂���ꍇ�A�O�������v��Ȃ��̂œ���������y�ł��B[l][r]
���[�N�t���[�ɍ��킹�āA���D�݂̎�@�����I�т��������B
[p]

[emotestop seg=0]

[jump storage=first.ks target=*start]


