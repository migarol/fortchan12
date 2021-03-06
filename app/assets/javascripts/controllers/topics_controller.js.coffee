Fortchan12.TopicsController = Ember.ArrayController.extend
  sortAscending: false
  sortProperties: ['updatedAt']

  actions:
    create: ->
      post = @get('store').createRecord('post')
      post.setProperties(@getProperties(['name','body','photo']))

      topic = @get('store').createRecord('topic')
      topic.get('posts').then (posts) ->
        posts.pushObject(post)

      topic.save().then =>

        @setProperties
          name: null
          body: null
          photo: null

        post.set('topic', topic)
        post.save()
