require 'capi/delegate/database_object'

module Capi
  module Database

    # => List all case databases (230 total)
    def list_case_databases
      delegate_db_type(@request.get('caseBrowse'))
    end

    # => List all legislation databases (28 total)
    def list_legislations_databases
      delegate_db_type(@request.get('legislationBrowse'))
    end

    def list_all_databases
      [list_case_databases, list_legislations_databases].flatten!
    end

    private
    def delegate_db_type(attr)
      result_hash = attr['caseDatabases'] || attr['legislationDatabases']
      objectify_hash result_hash
    end

    def objectify_hash(attributes)
      result = attributes.inject([]) do |obj, ele|
        obj << DatabaseObject.new(ele)
      end
    end
  end
end
