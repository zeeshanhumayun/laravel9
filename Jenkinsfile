pipeline {
	agent any
	stages {
		stage('Build') {

			//agent {
			//	dockerfile true
			//}
			steps {
				//sh 'echo new jenkins'
				//sh 'docker build -t hello_laravel_docker_image .'
				//sh 'php --version'					
				//sh 'composer install'
                //sh 'composer --version'
				//sh 'echo printing $testEnvVar nice yaar'
				//sh 'cp .env.example .env'
				//sh 'php artisan key:generate'				
				sh 'docker compose down'
				sh 'docker-compose up -d'
			}
		}
		stage('Run') {            
            steps {
	sh 'whoami'
//sh 'echo ${WORKSPACE} '
	//sh 'docker run -d -p 80:80 hello_laravel_docker_image'
 //sh 'rsync -rv --exclude=.git ${WORKSPACE}/.  /var/www/zeeshan1/html'
            }
        }
	}
}
