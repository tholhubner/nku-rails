module StudentsHelper
  def gravitar_url(student)
    if student.imageUrl.present?
      student.imageUrl
    else
      hash = Digest::MD5.hexdigest(student.email)
      imageUrl = "http://www.gravatar.com/avatar/#{hash}"
    end
  end
end
