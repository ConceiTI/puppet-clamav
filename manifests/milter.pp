#This class configure clamav-milter
class clamav::milter (

  String            $clamd_milter_service_ensure              = $clamav::clamav_milter_service_ensure,
  Boolean           $clamd_milter_service_enable              = $clamav::clamav_milter_service_enable,
  String            $clamd_milter_package_version             = $clamav::clamav_milter_package_version,
  Array             $clamd_milter_package                     = $clamav::clamav_milter_package,
  String            $clamd_milter_config                      = $clamav::clamav_milter_config,
  String            $clamd_milter_service                     = $clamav::clamav_milter_service,
  Optional[String]  $clamd_milter_user                        = $clamav::clamav_milter_user,
  Optional[String]  $clamd_milter_group                       = $clamav::clamav_milter_group,
  Optional[String]  $clamd_milter_miltersocket                = $clamav::clamav_milter_miltersocket,
  Optional[String]  $clamd_milter_logfile                     = $clamav::clamav_milter_logfile,
  Optional[String]  $clamd_milter_pidfile                     = $clamav::clamav_milter_pidfile,
  Boolean           $clamd_milter_logrotate                   = $clamav::clamav_milter_logrotate,
  Boolean           $clamd_milter_logsyslog                   = $clamav::clamav_milter_logsyslog,
  Optional[String]  $clamd_milter_temporarydirectory          = $clamav::clamav_milter_temporarydirectory,
  Boolean           $clamd_milter_install                     = true,
  Optional[Integer] $clamd_milter_milter_socket_mode          = 660,
  Optional[String]  $clamd_milter_fix_stale_socket            = 'yes',
  Optional[String]  $clamd_milter_allow_supplementary_groups  = undef, #'no',
  Optional[Integer] $clamd_milter_read_timeout                = 120,
  Optional[String]  $clamd_milter_foreground                  = 'no',
  Optional[String]  $clamd_milter_chroot                      = undef,
  Optional[String]  $clamd_milter_clamd_socket                = 'unix:/var/run/clamav/clamd.sock',
  Optional[String]  $clamd_milter_local_net                   = '1111:2222:3333::/48',
  Optional[String]  $clamd_milter_whitelist                   = undef, #'/etc/whitelisted_addresses',
  Optional[String]  $clamd_milter_skip_authenticated          = '^(tom|dick|henry)$',
  Optional[String]  $clamd_milter_max_file_size               = '25M',
  Optional[String]  $clamd_milter_on_clean                    = 'Accept',
  Optional[String]  $clamd_milter_on_infected                 = 'Quarantine',
  Optional[String]  $clamd_milter_on_fail                     = 'Defer',
  Optional[String]  $clamd_milter_reject_msg                  = undef,
  Optional[String]  $clamd_milter_add_header                  = 'Replace',
  Optional[String]  $clamd_milter_report_hostname             = 'my.mail.server.name',
  Optional[String]  $clamd_milter_virus_action                = '/usr/local/bin/my_infected_message_handler',
  Optional[String]  $clamd_milter_log_file_unlock             = 'yes',
  Optional[String]  $clamd_milter_log_file_max_size           = '2M',
  Optional[String]  $clamd_milter_log_time                    = 'yes',
  Optional[String]  $clamd_milter_log_facility                = 'LOG_MAIL',
  Optional[String]  $clamd_milter_log_verbose                 = 'yes',
  Optional[String]  $clamd_milter_log_infected                = 'Basic',
  Optional[String]  $clamd_milter_log_clean                   = 'Basic',
  Optional[String]  $clamd_milter_support_multiple_recipients = 'no',

  ){

    package { $clamd_milter_package:
      ensure => $clamd_milter_package_version,
    }

    file { $clamd_milter_config:
      ensure  => file,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => epp('clamav/milter.conf'),
    }

    service { $clamd_milter_service:
      ensure     => $clamd_milter_service_ensure,
      enable     => $clamd_milter_service_enable,
      hasrestart => true,
      hasstatus  => true,
      subscribe  => File[$clamd_milter_config],
    }

    Package[$clamd_milter_package] -> File[$clamd_milter_config] ~> Service[$clamd_milter_service]
}
