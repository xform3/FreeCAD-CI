// FreeCAD CI
//
//


pipeline {
  agent any

  stages {
    agent { dockerfile true }
    stage('Fetch sources') {
      steps {
        git checkout https://github.com/FreeCAD/FreeCAD
      }
    }

    stage('Build') {
      steps {
        mkdir build; cd build
        cmake ../freecad-source -DBUILD_QT5=ON -DPYTHON_EXECUTABLE=/usr/bin/python3 -DUSE_PYBIND11=ON
        make -j4
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
