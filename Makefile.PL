require IniConf;
use ExtUtils::MakeMaker;
$verbose = 1;
WriteMakefile(
  NAME => "IniConf.pm",
  DISTNAME => "IniConf.pm",
  VERSION_FROM => 'IniConf.pm',
  MAN1PODS => { },
  MAN3PODS => { 'IniConf.pm' =>
		'$(INST_MAN3DIR)/IniConf.pm.$(MAN3EXT)',
	      },
  'dist' => {COMPRESS=>'gzip -9f', SUFFIX => 'gz'}
);
