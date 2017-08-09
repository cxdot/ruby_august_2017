class TimesController < ApplicationController
  ENV['TZ'] = "America/Chicago"
  def main
    @time = Time.now
  end
end
