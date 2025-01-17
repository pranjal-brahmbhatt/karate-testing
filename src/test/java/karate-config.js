    function fn() {
      var env = karate.env; // get system property 'karate.env'
      if (!env) {
        env = 'dev';
      }
      karate.log('karate.env system property was:', env);
      var config = {
        env: env,
        myVarName: 'some',
            totalPassedCase: 0,
            totalFailedCase: 0,
            totalCases: 0
      }
      if (env == 'dev') {
        // customize
        // e.g. config.foo = 'bar';
      } else if (env == 'e2e') {
        // customize
      }
      return config;
    }