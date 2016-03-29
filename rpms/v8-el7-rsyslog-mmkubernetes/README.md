# How to use this spec file

Grab the el7 version of the rsyslog v8 spec and sources::

    $ wget https://copr-be.cloud.fedoraproject.org/results/portante/rsyslog-8.17/epel-7-x86_64/00171153-rsyslog/rsyslog-8.17.0-1.el7.centos.x86_64.rpm
    $ rpm2cpio rsyslog-8.17.0-1.el7.centos.src.rpm | cpio -i
    $ builddir=`pwd`

Create the rsyslog-mmkubernetes.tar.gz file containing only the plugin source code.
For example, if you have a local git repo with the source code in
$HOME/rsyslog::

    $ cd $HOME/rsyslog
    $ tar cfz $builddir/rsyslog-kubernetes.tar.gz contrib/mmkubernetes

Build the rsyslog-mmkubernetes srpm with the spec file::

    $ rpmbuild --define '_topdir .' --define '_sourcedir .' \
        --define 'dist .el7.centos' -bs rsyslog-mmkubernetes.spec

Now you can use the SRPMS/rsyslog-mmkubernetes-8.17.0-1.el7.centos.src.rpm to build the plugin.

mock::

    # cp /etc/mock/epel-7-x86_64.cfg /etc/mock/epel-7-rsyslog-x86_64.cfg
    # edit /etc/mock/epel-7-rsyslog-x86_64.cfg
    ## change the name to epel-7-rsyslog-x86_64
    ## add the portante repo from https://copr.fedorainfracloud.org/coprs/portante/rsyslog-v8.17/repo/epel-7/portante-rsyslog-v8.17-epel-7.repo
    $ mock -r epel-7-rsyslog-x86_64 SRPMS/rsyslog-mmkubernetes-8.17.0-1.el7.centos.src.rpm

or copr e.g. https://copr.fedorainfracloud.org/coprs/rmeggins/rsyslogv8-plugins/
