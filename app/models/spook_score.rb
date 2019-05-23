require "json"
require "ibm_watson/visual_recognition_v3"
include IBMWatson

class SpookScore
  attr_reader :results, :visual_recognition, :classifier_ids

  def initialize
    @visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: Rails.application.credentials.ibm_watson[:api_key]
    )
    @classifier_ids = ["SpookinessGenerator_1413939983"]
    @results = []
  end

  def visualize(image_url)
    classes = visual_recognition.classify(url: image_url, classifier_ids: self.classifier_ids)
    result = self.parse_result(classes.result)
    self.results << result
  end

  def total_score
    self.results.length ? self.results.inject(:+) / self.results.length : nil
  end

  def parse_result(result_hash)
    classes = result_hash["images"][0]["classifiers"][0]["classes"][0]
    if classes
      result_hash["images"][0]["classifiers"][0]["classes"][0]["score"]
    else
      1
    end
  end

end
