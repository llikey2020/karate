Feature: Testing for Batch Job API

Scenario: Test Batch Job POST Requests - 'jobs/create' Endpoint
    * table params
        | name          | type      | dCores! | dMemory  | eCores! | eMemory  | instances! | climit     | path         | template      |
        | 'job-123'     | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | 'job'         | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | 'job1'        | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'scalatest'   | 'Scala'   | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'javatest'    | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'pythontest'  | 'Python'  | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'rtest'       | 'R'       | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'coretest1'   | 'Java'    | 1       | '1Gi'    | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'coretest2'   | 'Java'    | 8       | '16Gi'   | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'coretest3'   | 'Java'    | 1024    | '1Ti'    | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'exectest1'   | 'Java'    | 2       | '2g'     | 1       | '1Gi'    | 1024       | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'exectest2'   | 'Java'    | 2       | '2g'     | 8       | '16Gi'   | 1          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'exectest3'   | 'Java'    | 2       | '2g'     | 1024    | '1Ti'    | 1          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'climittest1' | 'Java'    | 2       | '2g'     | 1       | '1Gi'    | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        # | 'climittest2' | 'Java'    | 2       | '2g'     | 1       | '1Gi'    | 2          | '1000m'    |'jobs/create' | 'jobTemplate' |
        # | 'climittest3' | 'Java'    | 2       | '2g'     | 1       | '1Gi'    | 2          | '1001m'    |'jobs/create' | 'jobTemplate' |

    * def result = call read('classpath:com/sequoiadb/featureTemplates/PostTemplate.feature') params
    * def created = get result[*].response
    * match each created[*].Output contains 'Created'

Scenario: Test Batch Job POST Requests - 'scheduledjobs/create' Endpoint
    * table params
        | name          | type      | dCores! | dMemory  | eCores! | eMemory  | instances! | path                   | isOneRun! | cron          | concPolicy | isSuspend! | successLimit! | failedLimit! | template    |
        | 'oneruntest'  | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '5 * * * *'   | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        | 'dailytest'   | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | false     | '30 6 * * *'  | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        #| 'weeklytest'  | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | false     | '30 6 * * 0'  | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        #| 'monthlytest' | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | false     | '30 6 15 * *' | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'sscalatest'  | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '30 6 * * *'  | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'sjavatest'   | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '30 6 * * 0'  | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'spythontest' | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '30 6 15 * *' | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'srtest'      | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '30 6 * * *'  | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'scoretest1'  | 'Java'    | 1       | '1Gi'    | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '30 6 * * 0'  | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'scoretest2'  | 'Java'    | 8       | '16Gi'   | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '30 6 15 * *' | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'scoretest3'  | 'Java'    | 1024    | '1Ti'    | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '30 6 * * *'  | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'sexectest1'  | 'Java'    | 2       | '2g'     | 1       | '1Gi'    | 1024       | 'scheduledjobs/create' | true      | '30 6 * * 0'  | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'sexectest2'  | 'Java'    | 2       | '2g'     | 8       | '16Gi'   | 1          | 'scheduledjobs/create' | true      | '30 6 15 * *' | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
        # | 'sexectest3'  | 'Java'    | 2       | '2g'     | 1024    | '1Ti'    | 1          | 'scheduledjobs/create' | true      | '30 6 15 * *' | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |

    * def result = call read('classpath:com/sequoiadb/featureTemplates/PostTemplate.feature') params
    * def created = get result[*].response
    * match each created[*].Output contains 'Created'

Scenario: Test Batch Job POST Requests - Negative test invalid inputs
    * table params
        | name          | type      | dCores! | dMemory  | eCores! | eMemory  | instances! | climit     | path         | template      |
        | 'job-123'     | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | 'JOB'         | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | '123'         | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | '   '         | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | ''            | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | '64characters64characters64characters64characters64characters64ch'     | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | 'negtest1'    | 'NOTJava' | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | 'negtest2'    | 'Java'    | 0.1     | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | 'negtest3'    | 'Java'    | 2       | '$2'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | 'negtest4'    | 'Java'    | 2       | '2g'     | 'a'     | '2g'     | 2          | '1'        |'jobs/create' | 'jobTemplate' |
        | 'negtest5'    | 'Java'    | 2       | '2g'     | 2       | '%@#&'   | 2          | '1'        |'jobs/create' | 'jobTemplate' |
    * def result = call read('classpath:com/sequoiadb/featureTemplates/NegPostTemplate.feature') params
    * def created = get result[*].response

Scenario: Test Batch Job POST Requests - Negative test payload missing required params
    * table params
        | name          | type      | dCores! | dMemory  | eCores! | eMemory  | instances! | climit     | path         | template      |
        | 'negtest6'    | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | '1'        |'jobs/create' | 'negTemplate' |
    * def result = call read('classpath:com/sequoiadb/featureTemplates/NegPostTemplate.feature') params
    * def created = get result[*].response

Scenario: Test Batch Job POST Requests - Negative test wrong endpoint
    * table params
        | path                  | name |
        | 'jobs/create/'        | ''   |
    * def result = call read('classpath:com/sequoiadb/featureTemplates/NegGetTemplate.feature') params
    * def created = get result[*].response

Scenario: Test Batch Job POST Requests - Negative test scheduled job exists
    * table params
        | name          | type      | dCores! | dMemory  | eCores! | eMemory  | instances! | path                   | isOneRun! | cron          | concPolicy | isSuspend! | successLimit! | failedLimit! | template    |
        | 'oneruntest'  | 'Java'    | 2       | '2g'     | 2       | '2g'     | 2          | 'scheduledjobs/create' | true      | '5 * * * *'   | 'Allow'    | false      | 5             | 5            | 'sjTemplate' |
    * def result = call read('classpath:com/sequoiadb/featureTemplates/PostTemplate.feature') params
    * def created = get result[*].response

Scenario: Test Batch Job GET Requests - jobs/get/{name} endpoint
    * table params
        | path                  | name       |
        | 'jobs/get/'           | 'job-123'  |
        | 'jobs/get/'           | 'job'      |
        | 'jobs/get/'           | 'job1'     |
        #| 'jobs/get/'           | 'sixtythreesixtythreesixtythreesixtythreesixtythreesixtythree123' |

    * def result = call read('classpath:com/sequoiadb/featureTemplates/GetTemplate.feature') params
    * def created = get result[*].response
    * match each created contains { Status: 200, JobName: '#string', Runs: '#array' }

Scenario: Test Batch Job GET Requests - scheduledjobs/get/{name} endpoint
    * table params
        | 'scheduledjobs/get/'  | 'onceruntest' |
        | 'scheduledjobs/get/'  | 'dailytest'   |
        # | 'scheduledjobs/get/'  | 'weeklytest'  |
        # | 'scheduledjobs/get/'  | 'monthlytest' |

    * def result = call read('classpath:com/sequoiadb/featureTemplates/GetTemplate.feature') params
    * def created = get result[*].response
    * match each created contains { Status: 200, JobName: '#string', Runs: '#array' }

Scenario: Test Batch Job GET Requests - jobs/list endpoint
    * def params = { path: 'jobs/list', name: '' }

    * def result = call read('classpath:com/sequoiadb/featureTemplates/GetTemplate.feature') params
    * def created = get result[*].response
    * match each created contains { Status: 200, TotalJobs: '#number', Jobs: '#array' }

Scenario: Test Batch Job GET Requests - scheduledjobs/list endpoint
    * def params = { path: 'scheduledjobs/list', name: '' }

    * def result = call read('classpath:com/sequoiadb/featureTemplates/GetTemplate.feature') params
    * def created = get result[*].response
    * match each created contains { Status: 200, TotalJobs: '#number', ScheduledJobs: '#array' }


Scenario: Test Batch Job DELETE Requests - jobs/delete/{name} endpoint
    * table params
        | path                  | name          |
        | 'jobs/delete/'        | 'job-123'     |
        | 'jobs/delete/'        | 'job'         |
        | 'jobs/delete/'        | 'job1'        |
        # | 'jobs/delete/'        | 'scalatest'   |
        # | 'jobs/delete/'        | 'javatest'    |
        # | 'jobs/delete/'        | 'pythontest'  |
        # | 'jobs/delete/'        | 'rtest'       |
        # | 'jobs/delete/'        | 'coretest1'   |
        # | 'jobs/delete/'        | 'coretest2'   |
        # | 'jobs/delete/'        | 'coretest3'   |
        # | 'jobs/delete/'        | 'exectest1'   |
        # | 'jobs/delete/'        | 'exectest2'   |
        # | 'jobs/delete/'        | 'exectest3'   |
        # | 'jobs/delete/'        | 'climittest1' |
        # | 'jobs/delete/'        | 'climittest2' |
        # | 'jobs/delete/'        | 'climittest3' |

    * def result = call read('classpath:com/sequoiadb/featureTemplates/DeleteTemplate.feature') params
    * def created = get result[*].response
    * match each created[*].Output contains 'Deleted'

Scenario: Test Batch Job DELETE Requests - scheduledjobs/delete/{name} endpoint
    * table params
        | path                    | name           |
        | 'scheduledjobs/delete/' | 'oneruntest'   |
        | 'scheduledjobs/delete/' | 'dailytest'    |
        # | 'scheduledjobs/delete/' | 'weeklytest'   |
        # | 'scheduledjobs/delete/' | 'monthlytest'  |
        # | 'scheduledjobs/delete/' | 'sscalatest'   |
        # | 'scheduledjobs/delete/' | 'spythontest'  |
        # | 'scheduledjobs/delete/' | 'srtest'       |
        # | 'scheduledjobs/delete/' | 'scoretest1'   |
        # | 'scheduledjobs/delete/' | 'scoretest2'   |
        # | 'scheduledjobs/delete/' | 'scoretest3'   |
        # | 'scheduledjobs/delete/' | 'sexectest1'   |
        # | 'scheduledjobs/delete/' | 'sexectest2'   |
        # | 'scheduledjobs/delete/' | 'sexectest3'   |

    * def result = call read('classpath:com/sequoiadb/featureTemplates/DeleteTemplate.feature') params
    * def created = get result[*].response
    * match each created[*].Output contains 'Deleted'