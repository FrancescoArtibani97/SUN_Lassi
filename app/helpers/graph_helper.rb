require 'httparty'
require 'json'
require 'net/http'


# Graph API helper methods
module GraphHelper

    GRAPH_HOST = 'https://graph.microsoft.com/v1.0/me'.freeze

    #GET
    def make_api_call_get(endpoint, token, params = nil)
        headers = {
            Authorization: "Bearer #{token}"
        }

        query = params || {}

        HTTParty.get("#{GRAPH_HOST}#{endpoint}",
                    headers: headers,
                    query: query
        )
    end

    #POST
    def make_api_call_post(endpoint, token, params = nil)

        headers = {
            "Authorization": "Bearer #{token}",
            "Content-type": "application/json",
            "Accept": "application/json",
            "Content-length": "64"
        }

        query = params || {}

        HTTParty.post("#{GRAPH_HOST}#{endpoint}",
            headers: headers,
            body: query.to_json
        )

    end

    def make_api_call_post_for_pages(endpoint, token, params = nil)

        headers = {
            "Authorization": "Bearer #{token}",
            "Content-type": "text/html",
            "Accept": "application/json"
        }

        query = params || {}

        HTTParty.post("#{GRAPH_HOST}#{endpoint}",
            headers: headers,
            body: query
        )

    end

    #DELETE
    def make_api_call_delete(endpoint, token)

        headers = {
            "Authorization": "Bearer #{token}"
        }

        HTTParty.delete("#{GRAPH_HOST}#{endpoint}",
            headers: headers
        )
    end

    #GET REQUESTS
    def get_notebook_id
        create_onenote_notebook current_user.token, "SUN - Università"
        ret = search_onenote_notebook current_user.token, "SUN - Università"

        ret["value"][0]["id"]
    end

    def get_onenote_pages(token, notebook)
        get_pages_url = "/onenote/notebooks/#{notebook}/pages"

        query = ""

        response = make_api_call_get get_pages_url, token, query

        raise response.parsed_response.to_s || "Request returned #{response.code}" unless response.code == 200
        response.parsed_response['value']
    end

    def get_onenote_sections(token, notebook)
        get_sections_url = "/onenote/notebooks/#{notebook}/sections"

        query = {
            "$select": "id,displayName,links"
        }

        response = make_api_call_get get_sections_url, token, query

        raise response.parsed_response.to_s || "Request returned #{response.code}" unless response.code == 200
        response.parsed_response['value']
    end

    #SEARCH REQUESTS
    def search_onenote_page(token, notebook, section, page, date)
        search_page_url = "/onenote/pages"

        filter = "parentNotebook/id eq '#{notebook}'"

        if section != nil
            filter = filter + " and parentSection/displayName eq '#{section}'"
        end

        if page != nil and section != nil
            filter = filter + " and title eq '#{page}'"
        end

        if page != nil and section != nil and date != nil
            filter = filter + "and createdDateTime eq #{date}"
        end


        query = {
            "$expand": "parentSection, parentNotebook",
            "$filter": filter
        }

        response = make_api_call_get search_page_url, token, query
        #puts response
        return response['value']
    end

    def search_onenote_section(token, notebook, section)
        search_notebook_url = "/onenote/notebooks/#{notebook}/sections"

        filter  = ""

        if section != nil
            filter = "displayName eq '#{section}'"
        end

        query = {
            "$filter": filter
        }

        response = make_api_call_get search_notebook_url, token, query
        return response['value']
    end

    def search_onenote_notebook(token, name)
        search_notebook_url = "/onenote/notebooks"

        query = {
            "$select": "id",
            "$filter": "displayName eq '#{name}'"
        }

        response = make_api_call_get search_notebook_url, token, query
    end

    #CREATE REQUESTS
    def create_onenote_page(token, page, section, notebook)
        create_page_url = "/onenote/sections/#{section}/pages/"

        payload =
            "<html>
                <head>
                    <title>#{page}</title>
                </head>
                <body>
                </body>
            </html>"

        make_api_call_post_for_pages create_page_url, token, payload
    end

    def create_onenote_section(token, section, notebook)

        create_section_url = "/onenote/notebooks/#{notebook}/sections/"

        payload = {
            "displayName" => section
        }

        make_api_call_post create_section_url, token, payload
    end

    def create_onenote_notebook(token, notebook)

        create_notebook_url = '/onenote/notebooks/'

        payload = {
            "displayName" => notebook
        }

        make_api_call_post create_notebook_url, token, payload
    end

    #DELETE REQUESTS
    def delete_onenote_page(token, page)

        delete_page_url = "/onenote/pages/#{page}"

        make_api_call_delete delete_page_url, token
    end

   # def delete_onenote_section(token, section)

    #    delete_section_url = "/onenote/sections/#{section}"

     #   make_api_call_delete delete_section_url, token
    #end

end

