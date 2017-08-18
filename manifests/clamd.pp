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
  Boolean           $clamd_allow_all_match_scan                   = true,
  Optional[String]  $clamd_allow_supplementary_groups             = $clamav::clamd_allow_supplementary_groups,
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
  Boolean           $clamd_follow_directory_symlinks              = false,
  Boolean           $clamd_follow_file_symlinks                   = false,
  Boolean           $clamd_force_to_disk                          = false,
  Boolean           $clamd_foreground                             = false,
  Boolean           $clamd_heuristic_scan_precedence              = false,
  Optional[Integer] $clamd_idle_timeout                           = 31,
  Boolean           $clamd_leave_temporary_files                  = false,
  Optional[String]  $clamd_local_socket                           = $clamav::clamd_localsocket,
  Optional[String]  $clamd_local_socket_group                     = $clamav::clamd_group,
  Optional[Integer] $clamd_local_socket_mode                      = 666,
  Boolean           $clamd_log_clean                              = false,
  Optional[String]  $clamd_log_facility                           = 'LOG_LOCAL6',
  Optional[String]  $clamd_log_file                               = $clamav::clamd_log_file,
  Optional[Integer] $clamd_log_file_max_size                      = 0,
  Boolean           $clamd_log_fileunlock                         = false,
  Boolean           $clamd_log_rotate                             = $clamav::clamd_logrotate,
  Boolean           $clamd_log_syslog                             = $clamav::clamd_logsyslog,
  Boolean           $clamd_log_time                               = true,
  Boolean           $clamd_log_verbose                            = false,
  Optional[Integer] $clamd_max_connection_queue_length            = 15,
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
  Hash              $clamd_options                                = {
    'AlgorithmicDetection'           => $clamd_algorithmic_detection,
    'AllowAllMatchScan'              => $clamd_allow_all_match_scan,
    'AllowSupplementaryGroups'       => $clamd_allow_supplementary_groups,
    'ArchiveBlockEncrypted'          => $clamd_archive_block_encrypted,
    'Bytecode'                       => $clamd_bytecode,
    'BytecodeSecurity'               => $clamd_bytecode_security,
    'BytecodeTimeout'                => $clamd_bytecode_timeout,
    'CommandReadTimeout'             => $clamd_command_read_timeout,
    'CrossFilesystems'               => $clamd_cross_filesystems,
    'DatabaseDirectory'              => $clamav::clamd_databasedirectory,
    'Debug'                          => $clamd_debug,
    'DetectBrokenExecutables'        => $clamd_detect_broken_executables,
    'DetectPUA'                      => $clamd_detect_pua,
    'DisableCertCheck'               => $clamd_disable_cert_check,
    'ExitOnOOM'                      => $clamd_exit_on_oom,
    'ExtendedDetectionInfo'          => $clamd_extended_detection_info,
    'FixStaleSocket'                 => $clamd_fix_stale_socket,
    'FollowDirectorySymlinks'        => $clamd_follow_directory_symlinks,
    'FollowFileSymlinks'             => $clamd_follow_file_symlinks,
    'ForceToDisk'                    => $clamd_force_to_disk,
    'Foreground'                     => $clamd_foreground,
    'HeuristicScanPrecedence'        => $clamd_heuristic_scan_precedence,
    'IdleTimeout'                    => $clamd_idle_timeout,
    'LeaveTemporaryFiles'            => $clamd_leave_temporary_files,
    'LocalSocket'                    => $clamav::clamd_localsocket,
    'LocalSocketGroup'               => $clamav::clamd_group,
    'LocalSocketMode'                => $clamd_local_socket_mode,
    'LogClean'                       => $clamd_log_clean,
    'LogFacility'                    => $clamd_log_facility,
    'LogFile'                        => $clamd_log_file,
    'LogFileMaxSize'                 => $clamd_log_file_max_size,
    'LogFileUnlock'                  => $clamd_log_fileunlock,
    'LogRotate'                      => $clamav::clamd_logrotate,
    'LogSyslog'                      => $clamav::clamd_logsyslog,
    'LogTime'                        => $clamd_log_time,
    'LogVerbose'                     => $clamd_log_verbose,
    'MaxConnectionQueueLength'       => $clamd_max_connection_queue_length,
    'MaxDirectoryRecursion'          => $clamd_max_directory_recursion,
    'MaxEmbeddedPE'                  => $clamd_max_embedded_pe,
    'MaxHTMLNoTags'                  => $clamd_max_html_no_tags,
    'MaxHTMLNormalize'               => $clamd_max_html_normalize,
    'MaxQueue'                       => $clamd_max_queue,
    'MaxScriptNormalize'             => $clamd_max_script_normalize,
    'MaxThreads'                     => $clamd_max_threads,
    'MaxZipTypeRcg'                  => $clamd_max_zip_type_rcg,
    'OLE2BlockMacros'                => $clamd_ole2_block_macros,
    'OfficialDatabaseOnly'           => $clamd_official_database_only,
    'PhishingAlwaysBlockCloak'       => $clamd_phishing_always_block_cloak,
    'PhishingAlwaysBlockSSLMismatch' => $clamd_phishing_always_block_ssl_mismatch,
    'PhishingScanURLs'               => $clamd_phishing_scan_urls,
    'PhishingSignatures'             => $clamd_phishing_signatures,
    'PidFile'                        => $clamav::clamd_pidfile,
    'ReadTimeout'                    => $clamd_read_timeout,
    'ScanArchive'                    => $clamd_scan_archive,
    'ScanELF'                        => $clamd_scan_elf,
    'ScanHTML'                       => $clamd_scan_html,
    'ScanMail'                       => $clamd_scan_mail,
    'ScanOLE2'                       => $clamd_scan_ole2,
    'ScanOnAccess'                   => $clamd_scan_on_access,
    'ScanPE'                         => $clamd_scan_pe,
    'ScanPartialMessages'            => $clamd_scan_partial_messages,
    'ScanSWF'                        => $clamd_scan_swf,
    'SelfCheck'                      => $clamd_self_check,
    'SendBufTimeout'                 => $clamd_send_buf_timeout,
    'StreamMaxLength'                => $clamd_stream_max_length,
    'StructuredDataDetection'        => $clamd_structured_data_detection,
    'TemporaryDirectory'             => $clamav::clamd_temporarydirectory,
    'User'                           => $clamav::clamd_user,
  },
){

  #install clamd
  package { $clamd_package:
    ensure => $clamd_package_version,
  }

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
      notify  => Service['clamd_service'],
    }
  }

  service { 'clamd_service':
    ensure     => $clamd_service_ensure,
    name       => $clamd_service,
    enable     => $clamd_service_enable,
    hasrestart => true,
    hasstatus  => true,
  }

}
