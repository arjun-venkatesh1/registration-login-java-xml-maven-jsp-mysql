node {
		environment {
			registry = "arjunvyadav/myapp"
			registryCredential = 'dockerhub'
		}
        stage('Checkout') {
            git url: 'https://github.com/arjun-venkatesh1/registration-login-java-xml-maven-jsp-mysql.git', branch: 'master'
        }
        def app
        stage('Image') {
                app = docker.build registry + ":$BUILD_NUMBER"
       }
       stage('Docker push')
        {
            docker.withRegistry('', registryCredential) {
                app.push()
                app.push('latest')
              }
       }    
}
