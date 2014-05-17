angular.module('Blog').factory('cvData', ['$http', ($http) ->

  cvData =
    data:
      posts: [{naslov: 'Loading', doctype: ''}]
    isLoaded: false

  cvData.loadCvs = (deferred) ->
    if !cvData.isLoaded
      $http.get('./cvs.json').success( (data) ->
        cvData.data.cvs = data
        cvData.isLoaded = true
        console.log('Successfully loaded cvs.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load cvs.')
        if deferred
          deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()


  cvData.createCv = (newPost) ->
    # Client-side data validation
    if newPost.newCvNaslov == '' or newPost.newCvDodatno == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_post:
        naslov: newPost.newCvNaslov
        dodatno: newPost.newCvDodatno

    # Do POST request to /posts.json
    $http.post('./cvs.json', data).success( (data) ->
      
      # Add new post to array of posts
      cvData.data.cvs.push(data)
      console.log('Successfully created cv.')

    ).error( ->
      console.error('Failed to create new cv.')
    )

    return true

  return cvData

  cvData.ediCv = (cv) ->
    # Client-side data validation
    if cv.newCvNaslov == '' or cv.newCvDodatno == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_post:
        naslov: cv.newCvNaslov
        dodatno: cv.newCvDodatno

    # Do POST request to /posts.json
    $http.post('./cvs.json', data).success( (data) ->

      # Add new post to array of posts
      cvData.data.cvs.push(data)
      console.log('Successfully updated cv.')

    ).error( ->
      console.error('Failed to update new cv.')
    )

    return true

  return cvData
])