module RequestSpecHelper
  def json
    JSON.parse(res.body)
  end
end