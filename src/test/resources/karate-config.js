function fn() {
    config = karate.callSingle('classpath:features/setup.feature');
    return {
        api: {
            baseUrl: 'https://restful-booker.herokuapp.com'
        },
        config
    };
}