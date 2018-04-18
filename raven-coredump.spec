Name: raven-coredump
Version: %{raven_coredump_version}
Release: 1%{?dist}
Summary: raven-coredump is a kernel coredump handler for sentry.io
Group: Karos Health/EasyViz
License: BSD
Vendor: Karos Health
BuildArch: noarch
%if 0%{?rhel}
Requires: devtoolset-7-gdb
%else
Requires: gdb
%endif
%if 0%{?rhel}
Requires: python-requests
%endif
%if 0%{?rhel} < 7
Requires: python-argparse
%endif


%description
raven-coredump is a coredump handler that reports program crashes to sentry.io.

%install
rm -rf $RPM_BUILD_ROOT
%{raven_coredump_source_dir}/raven-coredump --rpm-install=$RPM_BUILD_ROOT
%if 0%{?rhel}
sed -i -e 's|/usr/bin/gdb|/opt/rh/devtoolset-7/root/usr/bin/gdb|' $RPM_BUILD_ROOT/opt/raven-coredump/bin/raven-coredump
%endif

%post
sysctl -p %{_sysconfdir}/sysctl.d/80-raven-coredump.conf

%files
/opt/raven-coredump/bin/raven-coredump
%config(noreplace) %{_sysconfdir}/raven-coredump.conf
%config(noreplace) %{_sysconfdir}/sysctl.d/80-raven-coredump.conf
