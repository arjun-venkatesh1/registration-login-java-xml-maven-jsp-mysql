node {
 
    withMaven(maven:'maven 3.5.3') {
 
        stage('Checkout') {
            git url: 'https://github.com/arjun-venkatesh1/registration-login-java-xml-maven-jsp-mysql.git', credentialsId: 'githubtoken', branch: 'master'
        }
        def app
        stage('Image') {
                app = docker.build arjunvyadav/myapp + ":$BUILD_NUMBER"
       }
       stage('Docker push')
        {
            docker.withRegistry('', 'dockerhub') {
                app.push()
                app.push('latest')
              }
       }    
    }
}
