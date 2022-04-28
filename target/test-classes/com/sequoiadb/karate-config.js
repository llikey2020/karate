function fn(){
    var env = karate.env
    var config = {
        baseUrl: 'http://staging.planetrover.ca:32499/batch-job'
    }

    if (karate.env == 'staging'){
        config.baseUrl = 'http://staging.planetrover.ca:32499/batch-job'
    }

    karate.configure('connectTimeout', 5000)
    karate.configure('readTimeout', 5000)
    
    return config
}