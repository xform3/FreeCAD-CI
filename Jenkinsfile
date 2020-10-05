// FreeCAD CI
//
//


pipeline {
  agent { 
    dockerfile {
      filename 'Dockerfile'
    }
  }

  stages {
    stage('Fetch sources') {
      steps {
        sh 'ls -lat'
      }
    }

    stage('Build') {
      steps {
        sh 'mkdir -p build; cd build; cmake ../ -DBUILD_QT5=ON -DPYTHON_EXECUTABLE=/usr/bin/python3 -DUSE_PYBIND11=ON && make -j4'
      }
    }

    stage('Create App Image') {
      steps {
        echo 'Skipping creating images'
      }
    }

    stage('Upload App Image') {
      steps {
        echo 'Skipping uploading app images'
      }
    }
  }

}
