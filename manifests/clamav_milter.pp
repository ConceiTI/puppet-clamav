#This class configure clamav-milter
class clamav::clamav_milter (

  String  $clamav_milter_service_ensure            = $clamav::clamav_milter_service_ensure,
  Boolean $clamav_milter_service_enable            = $clamav::clamav_milter_service_enable,
  String  $clamav_milter_package_version           = $clamav::clamav_milter_package_version,
  Array   $clamav_milter_package                   = $clamav::clamav_milter_package,
  String  $clamav_milter_config                    = $clamav::clamav_milter_config,
  String  $clamav_milter_service                   = $clamav::clamav_milter_service,
  String  $clamav_milter_user                      = $clamav::clamav_milter_user,
  String  $clamav_milter_group                     = $clamav::clamav_milter_group,
  String  $clamav_milter_miltersocket              = $clamav::clamav_milter_miltersocket,
  String  $clamav_milter_logfile                   = $clamav::clamav_milter_logfile,
  String  $clamav_milter_pidfile                   = $clamav::clamav_milter_pidfile,
  Boolean $clamav_milter_logrotate                 = $clamav::clamav_milter_logrotate,
  Boolean $clamav_milter_logsyslog                 = $clamav::clamav_milter_logsyslog,
  String  $clamav_milter_temporarydirectory        = $clamav::clamav_milter_temporarydirectory,
  Boolean $clamd_milter_install                    = true,
  String  $clamd_milter_milter_socket_mode         = '660',
  String  $clamd_milter_fix_stale_socket           =  'yes',
  String  $clamd_milter_allow_supplementary_groups = 'no',
  String  $clamd_milter_read_timeout               = '120',
  String  $clamd_milter_foreground                 = 'no',
  String  $clamd_milter_chroot                     = '/newroot',
  String  $clamd_milter_clamd_socket               = 'unix:/var/run/clamav/clamd.sock',
  String  $clamd_milter_local_net                  = '1111:2222:3333::/48',
  String  $clamd_milter_whitelist                  = '/etc/whitelisted_addresses',
  String  $clamd_milter_skip_authenticated         = '^(tom|dick|henry)$',
  String  $clamd_milter_max_file_size              = '25M',
  String  $clamd_milter_on_clean                   = 'Accept',
  String  $clamd_milter_on_infected                = 'Quarantine',
  String  $clamd_milter_on_fail                    = 'Defer',
  String  $clamd_milter_reject_msg                 = 'undef',
  String  $clamd_milter_add_header                 = 'Replace',
  String  $clamd_milter_report_hostname            = 'my.mail.server.name',
  String  $clamd_milter_virus_action               = '/usr/local/bin/my_infected_message_handler',
  String  $clamd_milter_log_file_unlock = 'yes',
  String  $clamd_milter_log_file_max_size = '2M',
  String  $clamd_milter_log_time = 'yes',
  String  $clamd_milter_log_facility = 'LOG_MAIL',
  String  $clamd_milter_log_verbose = 'yes',
  String  $clamd_milter_log_infected = 'Basic',
  String  $clamd_milter_log_clean = 'Basic',
  String  $clamd_milter_support_multiple_recipients = 'no',

  ){

#    unless ($::osfamily == 'RedHat') and (versioncmp($::operatingsystemrelease, '7.0') >= 0) {
#      fail("OS family ${::osfamily}-${::operatingsystemrelease} is not supported. Only RedHat >= 7 is suppported.")
#    }

    package { $clamav_milter_package:
      ensure => $clamav_milter_package_version,
    }

    file { $clamav_milter_config:
      ensure  => file,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      #content => epp('clamav/clamav-milter.conf'),
    }

    service { $clamav_milter_service:
      ensure     => $clamav_milter_service_ensure,
      enable     => $clamav_milter_service_enable,
      hasrestart => true,
      hasstatus  => true,
    #  subscribe  => File[clamav_milter_config],
    }

    Package[$clamav_milter_package] -> File[$clamav_milter_config] ~> Service[$clamav_milter_service]

}
