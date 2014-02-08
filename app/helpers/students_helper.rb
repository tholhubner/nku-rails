module StudentsHelper
  def gravitar_url(student)
    if student.image_url.present?
      student.image_url
    else
      hash = Digest::MD5.hexdigest(student.email)
      image_src = "http://www.gravatar.com/avatar/#{hash}"
    end
  end
end
