use 5.008001;
use strict;
use warnings;
use Module::Build;

my %supported = map { ( $_ => 1 ) } qw/linux solaris freebsd gnukfreebsd darwin MSWin32/;

my $implementation = $supported{$^O} ? 'Sys::Sendfile' : 'File::Map';

my ##{ Data::Dumper->new([ $plugin->module_build_args ], [ 'module_build_args' ])->Sortkeys(1)->Indent(1)->Useqq(1)->Dump; ##};
$module_build_args->{requires}{$implementation} = 0;

my $builder = Module::Build->new(
	%$module_build_args,
);

$builder->create_build_script();

