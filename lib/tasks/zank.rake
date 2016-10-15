namespace :zank do
  desc 'zank posts and user data.'
  task posts: :environment do
    client = Zank::Client.new(ENV['ZANK_USERNAME'], ENV['ZANK_PASSWORD'])
    client.login

    ARGV.each { |a| task a.to_sym do ; end }
    days = ARGV[1] || 60

    final_timestamp = ((Time.now.to_f - days.to_i.day) * 1000).to_i
    timestamp = (Time.now.to_f * 1000).to_i

    while timestamp > final_timestamp
      timestamp = nil
      posts = client.posts(circle_id: 41, timestamp: timestamp)
      posts.each do |post|
        p = Post.find_or_initialize_by(id: post.id)
        p.update(
          user_id:       post.user_id,
          city:          post.city,
          title:         post.title,
          content:       post.content,
          updated_at:    post.updated_at,
          comment_count: post.comment_count,
          cover_url:     post.cover_url,
          img_small:     post.img_small,
          img_big:       post.img_big
        )

        user = client.user_detail(post.user_id)
        u = User.find_or_initialize_by(id: post.user_id)
        u.update(
          age:            user.age,
          avatar:         user.avatar,
          email:          user.email,
          height:         user.height,
          phone:          user.phone,
          province:       user.province,
          sex_type:       user.sex_type,
          username:       user.username,
          weight:         user.weight
        )
      end
      sleep 1
      timestamp = posts.last.timestamp
    end
  end

  desc 'zank circle data.'
  task circles: :environment do
    client = Zank::Client.new(ENV['ZANK_USERNAME'], ENV['ZANK_PASSWORD'])
    client.login

    circles = client.circles + client.circles(page: 2)

    circles.each do |circle|
      c = Circle.find_or_initialize_by(id: circle.id)
      c.update(
        name: circle.name,
        descript: circle.descript,
        cover_url: circle.cover_url,
        created_at: circle.created_at,
      )
    end
  end
end