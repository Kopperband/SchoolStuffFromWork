class SocialShare
  @@platforms = {
    facebook: "https://www.facebook.com/sharer/sharer.php?u=%{url}",
    twitter: "https://twitter.com/intent/tweet?text=%{url} %{title}",
    linkedin: "http://www.linkedin.com/shareArticle?mini=true&url=%{url}&title=%{title}&summary=%{summary}&source=Recognize"
  }

  def initialize(platform, url, title, summary = "")
    @platform, @title, @share_url, @summary = platform.to_sym, title, url, summary

  end
  def self.url(platform, title, url, summary = "")
    new(platform, title, url, summary).url
  end

  def self.get_links_for_all(title, url, summary = "")
    @@platforms.keys.map do |platform|
      url(platform, title, url, summary)
    end
  end

  def url
    @url ||= generate_url
  end

  def generate_url
    url_string =@@platforms[@platform] % {title: @title, url: @share_url, summary: @summary}
  end

end

pp SocialShare.get_links_for_all(title,url)
