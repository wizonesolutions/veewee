Feature: veewee box validation
  As a valid veewee box
  I need to comply to a set of rules

  @vmfusion @virtualbox @kvm
  Scenario: Valid definition
  Given a veeweebox based on definition
    When I ssh to veeweebox with the following credentials:
    | username| password |
    | vagrant | vagrant  |
    And I run "whoami"
    Then I should see "vagrant" in the output

  @vmfusion @virtualbox @kvm
  Scenario: Checking login
    When I ssh to "127.0.0.1" with the following credentials:
      | username| password |
      | vagrant | vagrant  |
    And I run "whoami"
    Then I should see "vagrant" in the output

  @vmfusion @virtualbox @kvm
  Scenario: Checking sudo
    When I ssh to "127.0.0.1" with the following credentials:
      | username| password |
      | vagrant | vagrant  |
    And I run "sudo whoami"
    Then I should see "root" in the output

  @vmfusion @virtualbox @kvm
  Scenario: Checking ruby
    When I ssh to "127.0.0.1" with the following credentials:
      | username| password |
      | vagrant | vagrant  |
    And I run ". /etc/profile ;ruby --version 2> /dev/null 1> /dev/null;  echo $?"
    Then I should see "0" in the output

  @vmfusion @virtualbox @kvm
  Scenario: Checking gem
    When I ssh to "127.0.0.1" with the following credentials:
      | username| password |
      | vagrant | vagrant  |
    And I run ". /etc/profile; gem --version 2> /dev/null 1> /dev/null ; echo $?"
    Then I should see "0" in the output

  @vmfusion @virtualbox @kvm
  Scenario: Checking chef
    When I ssh to "127.0.0.1" with the following credentials:
      | username| password |
      | vagrant | vagrant  |
    And I run ". /etc/profile ;chef-client --version 2> /dev/null 1>/dev/null; echo $?"
    Then I should see "0" in the output

  @vmfusion @virtualbox @kvm
  Scenario: Checking puppet
    When I ssh to "127.0.0.1" with the following credentials:
      | username| password |
      | vagrant | vagrant  |
    And I run ". /etc/profile ; puppet --version 2> /dev/null 1>/dev/null; echo $?"
    Then I should see "0" in the output

  @vagrant
  Scenario: Checking shared folders
    When I ssh to "127.0.0.1" with the following credentials:
      | username| password |keyfile  |
      | vagrant | vagrant  | vagrant-private.key |
    And I run "mount|grep veewee-validation"
    Then I should see "veewee-validation" in the output
