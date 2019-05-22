require "json"
require "ibm_watson/visual_recognition_v3"
include IBMWatson

class SpookScore
  attr_reader :result, :visual_recognition

  def initialize(url)
    @visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: Rails.application.credentials.ibm_watson[:api_key]
    )
    classifier_ids = ["SpookinessGenerator_1413939983"]
    classes = visual_recognition.classify(url: url, classifier_ids: classifier_ids)
    @result = classes.result
  end

end
