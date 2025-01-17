# Feature file for initializing global stats# initializeStats.feature
Feature: Initialize Global Stats
  Scenario: Initialize Stats
    * def stats = { totalPassedCase: 0, totalFailedCase: 0, totalCases: 0 }