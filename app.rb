require "cuba"
require "cuba/render"
require "ohm"
require "erubis"

require_relative "lib/talk"
require_relative "lib/comment"

Ohm.connect(
  host: "localhost",
  port: "6379"
)

Cuba.plugin Cuba::Render

Cuba.settings[:render][:options] = {
    default_encoding: Encoding.default_external,
    escape_html: true,
}

Cuba.use Rack::Static,
    root: "public",
    urls: ["/js", "/css", "/images"]

Cuba.define do
  on "charlas/crear" do
    on get do
      res.write(view("create", talk: Talk.new))
    end

    on post do
      talk = Talk.new(
        title: req.POST["title"],
        author: req.POST["author"],
        description: req.POST["description"],
      )

      talk.save

      if talk.new?
        res.write(view("create", talk: talk))
      else
        res.redirect("/charlas/#{talk.id}", 302)
      end
    end
  end

  on "charlas/:id" do |id|
    talk = Talk[id]

    on get do
      res.write(view("talk", talk: talk, comment: Comment.new))
    end

    on post do
      comment = Comment.new(
        user: req.POST["user"],
        rating: req.POST["rating"],
        body: req.POST["body"],
        talk_id: id,
      )

      comment.save

      if comment.new?
        res.write(view("talk", talk: talk, comment: comment))
      else
        res.redirect("/charlas/#{id}", 302)
      end
    end
  end

  on root do
    talks = Talk.all
    res.write(view("home", talks: talks))
  end
end
