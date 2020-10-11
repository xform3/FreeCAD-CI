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
        sh 'mkdir -p build; cd build; mkdir FreeCAD; cmake ../FreeCAD -DCMAKE_INSTALL_REFIX=`pwd`/FreeCAD -DBUILD_QT5=ON -DPYTHON_EXECUTABLE=/usr/bin/python3 -DUSE_PYBIND11=ON && make -j4 install'
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

  post {
    success {
      archiveArtifacts artifacts: 'build/FreeCAD', fingerprint: true
    }
  }

}
