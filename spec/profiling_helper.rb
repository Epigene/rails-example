require "csv"

class Listener

  def example_group_started(notification)
    @group_start_times ||= {}
    @group_start_times[notification.group] = Time.now.to_f
  end

  def example_group_finished(notification)
    execution_time = (Time.now.to_f - @group_start_times[notification.group]).round(3)

    group_output << (Group.new(notification.group).to_csv << execution_time)
  end

  def example_finished(notification)
    example_output << Example.new(notification.example).to_csv
  end

  alias :example_passed :example_finished
  alias :example_failed :example_finished

  private

  def example_output
    @example_output ||= CSV.open("#{Rails.root}/spec/profiling_results.csv", "w").tap { |csv| csv << Example::FIELDS }
  end

  def group_output
    @group_output ||= CSV.open("#{Rails.root}/spec/group_profiling_results.csv", "w").tap { |csv| csv << Group::FIELDS }
  end

  class Example
    FIELDS = %w{ file line_number description result time }.freeze

    def initialize(example)
      @example = example
    end

    def file
      metadata[:file_path]
    end

    def line_number
      metadata[:line_number]
    end

    def description
      metadata[:full_description]
    end

    def time
      execution_result.run_time
    end

    def result
      execution_result.status
    end

    def to_csv
      FIELDS.map { |field| send(field) }
    end

    private

    def metadata
      @example.metadata
    end

    def execution_result
      @example.execution_result
    end
  end

  class Group
    FIELDS = %w{ file line_number group time }.freeze

    def initialize(group)
      @group = group
    end

    def file
      metadata[:file_path]
    end

    def group_name
      @group.to_s.sub("RSpec::ExampleGroups::", '')
    end

    def line_number
      metadata[:line_number]
    end

    def to_csv
      [file, line_number, group_name]
    end

    private

    def metadata
      @group.metadata
    end
  end
end

RSpec.configure do |config|
  config.reporter.register_listener(
    Listener.new, :example_group_started, :example_group_finished, :example_passed, :example_failed
  )
end
