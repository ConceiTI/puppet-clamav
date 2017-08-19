#This class configure clamd

#parameter [clamd_options] NOT CHANGE, this parameter is usage for template
class clamav::clamd (

  Optional[Array]   $clamd_package                                = $clamav::clamd_package,
  Optional[String]  $clamd_package_version                        = $clamav::clamd_package_version,
  Optional[String]  $clamd_config                                 = $clamav::clamd_config,
  Optional[String]  $clamd_service                                = $clamav::clamd_service,
  Optional[String]  $clamd_service_ensure                         = $clamav::clamd_service_ensure,
  Boolean           $clamd_service_enable                         = $clamav::clamd_service_enable,
  Boolean           $clamd_algorithmic_detection                  = true,
  Optional[String]  $clamd_allow_all_match_scan                   = undef, #'no',
  Boolean           $clamd_archive_block_encrypted                = false,
  Boolean           $clamd_bytecode                               = true,
  Optional[String]  $clamd_bytecode_security                      = 'TrustSigned',
  Optional[Integer] $clamd_bytecode_timeout                       = 60000,
  Optional[Integer] $clamd_command_read_timeout                   = 5,
  Boolean           $clamd_cross_filesystems                      = true,
  Optional[String]  $clamd_database_directory                     = $clamav::clamd_databasedirectory,
  Boolean           $clamd_debug                                  = false,
  Boolean           $clamd_detect_broken_executables              = false,
  Boolean           $clamd_detect_pua                             = false,
  Boolean           $clamd_disable_cert_check                     = false,
  Boolean           $clamd_exit_on_oom                            = false,
  Boolean           $clamd_extended_detection_info                = true,
  Boolean           $clamd_fix_stale_socket                       = true,
  Optional[String]  $clamd_local_socket                           = $clamav::clamd_localsocket,
  Optional[String]  $clamd_local_socket_group                     = $clamav::clamd_group,
  Optional[Integer] $clamd_local_socket_mode                      = 666,
  Optional[Integer] $clamd_local_tcp_socket                       = 3310,
  Boolean           $clamd_follow_directory_symlinks              = false,
  Boolean           $clamd_follow_file_symlinks                   = false,
  Boolean           $clamd_force_to_disk                          = false,
  Boolean           $clamd_foreground                             = false,
  Boolean           $clamd_heuristic_scan_precedence              = false,
  Optional[Integer] $clamd_idle_timeout                           = 31,
  Boolean           $clamd_leave_temporary_files                  = false,
  Boolean           $clamd_log_clean                              = false,
  Optional[String]  $clamd_log_facility                           = 'LOG_LOCAL6',
  Optional[String]  $clamd_log_file                               = $clamav::clamd_log_file,
  Optional[Integer] $clamd_log_file_max_size                      = 0,
  Boolean           $clamd_log_fileunlock                         = false,
  Boolean           $clamd_log_rotate                             = $clamav::clamd_logrotate,
  Boolean           $clamd_log_syslog                             = $clamav::clamd_logsyslog,
  Boolean           $clamd_log_time                               = true,
  Boolean           $clamd_log_verbose                            = false,
  Optional[Integer] $clamd_max_connection_queue_length            = 30,
  Optional[Integer] $clamd_max_directory_recursion                = 15,
  Optional[String]  $clamd_max_embedded_pe                        = '10M',
  Optional[String]  $clamd_max_html_no_tags                       = '2M',
  Optional[String]  $clamd_max_html_normalize                     = '10M',
  Optional[String]  $clamd_max_queue                              = '101',
  Optional[String]  $clamd_max_script_normalize                   = '5M',
  Optional[String]  $clamd_max_threads                            = '12',
  Optional[String]  $clamd_max_zip_type_rcg                       = '1M',
  Boolean           $clamd_ole2_block_macros                      = false,
  Boolean           $clamd_official_database_only                 = false,
  Boolean           $clamd_phishing_always_block_cloak            = false,
  Boolean           $clamd_phishing_always_block_ssl_mismatch     = false,
  Boolean           $clamd_phishing_scan_urls                     = true,
  Boolean           $clamd_phishing_signatures                    = true,
  Optional[String]  $clamd_pid_file                               = $clamav::clamd_pidfile,
  Optional[Integer] $clamd_read_timeout                           = 190,
  Boolean           $clamd_scan_archive                           = true,
  Boolean           $clamd_scan_elf                               = true,
  Boolean           $clamd_scan_html                              = true,
  Boolean           $clamd_scan_mail                              = true,
  Boolean           $clamd_scan_ole2                              = true,
  Boolean           $clamd_scan_on_access                         = false,
  Boolean           $clamd_scan_pe                                = true,
  Boolean           $clamd_scan_partial_messages                  = false,
  Boolean           $clamd_scan_swf                               = true,
  Optional[Integer] $clamd_self_check                             = 3600,
  Optional[Integer] $clamd_send_buf_timeout                       = 200,
  Optional[String]  $clamd_stream_max_length                      = '25M',
  Boolean           $clamd_structured_data_detection              = false,
  Optional[String]  $clamd_temporary_directory                    = $clamav::clamd_temporarydirectory,
  Optional[String]  $clamd_user                                   = $clamav::clamd_user,
  Optional[String]  $clamd_tcp_addr                               = '127.0.0.1',
  Optional[Integer] $clamd_stream_min_port                        = 1024,
  Optional[Integer] $clamd_stream_max_port                        = 2048,
  Optional[String]  $clamd_exclude_path                           = '^/proc/', # Array
  Optional[String]  $clamd_virus_event                            = '/usr/local/bin/send_sms 123456789 "VIRUS ALERT: %v"',
  Optional[String]  $clamd_allow_supplementary_groups             = undef, #'yes',
  Optional[String]  $clamd_exclude_pua                            = 'NetTool', #Arra
  Optional[Array]   $clamd_include_pua                            = ['Scanner','RAT','Spy'],  #Array
  Optional[String]  $clamd_disable_cache                          = 'yes',
  Optional[String]  $clamd_scan_pdf                               = 'yes',
  Optional[String]  $clamd_scan_xml_docs                          = 'yes',
  Optional[String]  $clamd_scan_hwp3                              = 'yes',
  Optional[String]  $clamd_partition_intersection                 = 'yes',
  Optional[Integer] $clamd_structured_min_credit_card_count       = 3,
  Optional[Integer] $clamd_structured_min_ssn_count               = 3,
  Optional[String]  $clamd_structured_ssn_format_normal           = 'yes',
  Optional[String]  $clamd_structured_ssn_format_stripped         = 'yes',
  Optional[String]  $clamd_max_scan_size                          = '150M',
  Optional[String]  $clamd_max_file_size                          = '50M',
  Optional[Integer] $clamd_max_recursion                          = 10,
  Optional[Integer] $clamd_max_files                              = 15000,
  Optional[Integer] $clamd_max_partitions                         = 128,
  Optional[Integer] $clamd_max_icons_pe                           = 200,
  Optional[Integer] $clamd_max_rec_hwp3                           = 16,
  Optional[Integer] $clamd_pcre_match_limit                       = 20000,
  Optional[Integer] $clamd_pcre_rec_match_limit                   = 10000,
  Optional[String]  $clamd_pcre_max_file_size                     = '100M',
  Optional[String]  $clamd_on_access_mount_path                   = undef,
  Optional[String]  $clamd_on_access_max_file_size                = '10M',
  Optional[String]  $clamd_on_access_include_path                 = undef,
  Optional[String]  $clamd_on_access_exclude_path                 = undef,
  Optional[String]  $clamd_on_access_exclude_id                   = undef,
  Optional[String]  $clamd_on_access_disable_ddd                  = undef,
  Optional[String]  $clamd_on_access_prevention                   = 'yes',
  Optional[String]  $clamd_on_access_extra_scanning               = 'yes',
  Optional[String]  $clamd_stats_enabled                          = 'yes',
  Optional[String]  $clamd_stats_pe_isabled                       = 'yes',
  Optional[String]  $clamd_stats_host_id                          = 'auto',
  Optional[Integer] $clamd_stats_timeout                          = 10,

){

  #install clamd
  package { $clamd_package:
    ensure => $clamd_package_version,
  }

  file { $clamd_config:
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => epp('clamav/clamd.conf'),
  }

  service { $clamd_service:
    ensure     => $clamd_service_ensure,
    name       => $clamd_service,
    enable     => $clamd_service_enable,
    hasrestart => true,
    hasstatus  => true,
  }

  Package[$clamd_package] -> File[$clamd_config] ~> Service[$clamd_service]
  /*
  $clamd_options.each | $key, $value| {
    if $value == undef {
      $change = "rm ${key}"
    }else {
      $change = "set  ${key} ${value}"
    }

    augeas { "manage clamd '${key}' ":
      incl    => $clamd_config,
      lens    => 'Clamav.lns',
      changes => $change,
      require => Package[$clamd_package],
      notify  => Service[$clamd_service],
    }
  }
*/
}
