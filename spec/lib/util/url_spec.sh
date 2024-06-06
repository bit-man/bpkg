Describe 'url.sh'
  Include lib/utils/url.sh
  
  It 'solves Gitlab'
    When call bpkg_solve_uri 'https://gitlab.com' bb cc dd
    The output should equal 'bb/cc/-/raw/dd'
  End
  
  It 'solves Github'
    When call bpkg_solve_uri 'https://github.com' bb cc dd
    The output should equal 'bb/cc/dd'
  End

  It 'solves everything else'
    When call bpkg_solve_uri 'https://my-git-domain.pe' bb cc dd
    The output should equal 'bb/cc/dd'
  End
End
