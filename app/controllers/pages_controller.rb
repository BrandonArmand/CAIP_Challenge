class PagesController < ApplicationController
  def show
    _ids = search[:items].collect{ |i| i[:id][:videoId] }
    videoItems = get_full_details(_ids)["items"]
    @videos = []

    if params[:search]
      videoItems.each do |video|
        searchList = [video["snippet"]["title"], video["snippet"]["channelTitle"], video["snippet"]["description"], video["snippet"]["tags"]].join(' ')
        @videos.push(video) if searchList.downcase.include?(params[:search].downcase) 
      end
    else
      @videos = videoItems
    end

    respond_to do |format|
      format.html
      format.json { render json: @videos }
    end
  end

  def search
    {
      "kind": "youtube#searchListResponse",
      "etag": "\"p4VTdlkQv3HQeTEaXgvLePAydmU/_vFc4jl-kSiJ3A_3IILz5lic4_I\"",
      "nextPageToken": "CAUQAA",
      "regionCode": "US",
      "pageInfo": {
       "totalResults": 444966,
       "resultsPerPage": 5
      },
      "items": [
       {
        "kind": "youtube#searchResult",
        "etag": "\"p4VTdlkQv3HQeTEaXgvLePAydmU/sppaLSYgN6LzzMYPZu4AW2W1Oj4\"",
        "id": {
         "kind": "youtube#video",
         "videoId": "pPy0GQJLZUM"
        },
        "snippet": {
         "publishedAt": "2016-10-19T16:44:37.000Z",
         "channelId": "UC29ju8bIPH5as8OGnQzwJyA",
         "title": "Ruby On Rails In 60 Minutes",
         "description": "In this video we will cover all of the fundamentals of the Ruby on Rails framework by building a blog application with comment functionality Routes Controllers ...",
         "thumbnails": {
          "default": {
           "url": "https://i.ytimg.com/vi/pPy0GQJLZUM/default.jpg",
           "width": 120,
           "height": 90
          },
          "medium": {
           "url": "https://i.ytimg.com/vi/pPy0GQJLZUM/mqdefault.jpg",
           "width": 320,
           "height": 180
          },
          "high": {
           "url": "https://i.ytimg.com/vi/pPy0GQJLZUM/hqdefault.jpg",
           "width": 480,
           "height": 360
          }
         },
         "channelTitle": "Traversy Media",
         "liveBroadcastContent": "none"
        }
       },
       {
        "kind": "youtube#searchResult",
        "etag": "\"p4VTdlkQv3HQeTEaXgvLePAydmU/a3qY8nJkR-gBQEZWQod_zjoU5EY\"",
        "id": {
         "kind": "youtube#video",
         "videoId": "zppMfm4fuxM"
        },
        "snippet": {
         "publishedAt": "2015-09-07T06:47:59.000Z",
         "channelId": "UCfWZwsP8trUy5uHJg8gcGIQ",
         "title": "Intro to Rails: What is Ruby on Rails?",
         "description": "To pick up the bundle for this course (which includes an ebook version, offline hd videos, code, photoshop & illustrator files and my wireframe kits) visit ...",
         "thumbnails": {
          "default": {
           "url": "https://i.ytimg.com/vi/zppMfm4fuxM/default.jpg",
           "width": 120,
           "height": 90
          },
          "medium": {
           "url": "https://i.ytimg.com/vi/zppMfm4fuxM/mqdefault.jpg",
           "width": 320,
           "height": 180
          },
          "high": {
           "url": "https://i.ytimg.com/vi/zppMfm4fuxM/hqdefault.jpg",
           "width": 480,
           "height": 360
          }
         },
         "channelTitle": "Mackenzie Child",
         "liveBroadcastContent": "none"
        }
       },
       {
        "kind": "youtube#searchResult",
        "etag": "\"p4VTdlkQv3HQeTEaXgvLePAydmU/HgDiCb05kN1BVtBL2HFhumhS8qs\"",
        "id": {
         "kind": "youtube#video",
         "videoId": "GY7Ps8fqGdc"
        },
        "snippet": {
         "publishedAt": "2015-03-04T17:57:48.000Z",
         "channelId": "UCwRXb5dUK4cvsHbx-rGzSgw",
         "title": "Ruby on Rails Tutorial",
         "description": "Get the Transcript Here : http://goo.gl/HIK00D Ruby Tutorial : https://www.youtube.com/watch?v=Dji9ALCgfpM Support me on Patreon ...",
         "thumbnails": {
          "default": {
           "url": "https://i.ytimg.com/vi/GY7Ps8fqGdc/default.jpg",
           "width": 120,
           "height": 90
          },
          "medium": {
           "url": "https://i.ytimg.com/vi/GY7Ps8fqGdc/mqdefault.jpg",
           "width": 320,
           "height": 180
          },
          "high": {
           "url": "https://i.ytimg.com/vi/GY7Ps8fqGdc/hqdefault.jpg",
           "width": 480,
           "height": 360
          }
         },
         "channelTitle": "Derek Banas",
         "liveBroadcastContent": "none"
        }
       },
       {
        "kind": "youtube#searchResult",
        "etag": "\"p4VTdlkQv3HQeTEaXgvLePAydmU/k3hmgtEozxiqlw8y4MMCG_O1dKk\"",
        "id": {
         "kind": "youtube#video",
         "videoId": "V4zibaoGjXY"
        },
        "snippet": {
         "publishedAt": "2019-07-17T14:54:17.000Z",
         "channelId": "UCyUBW72KU30dfAYWLVNZO8Q",
         "title": "Should you DROP Ruby and Rails for Something New?",
         "description": "Ruby and Rails are not nearly as popular as it used to be. But it is still used in certain places. That said, should you learn something new if you are a Ruby / Rails ...",
         "thumbnails": {
          "default": {
           "url": "https://i.ytimg.com/vi/V4zibaoGjXY/default.jpg",
           "width": 120,
           "height": 90
          },
          "medium": {
           "url": "https://i.ytimg.com/vi/V4zibaoGjXY/mqdefault.jpg",
           "width": 320,
           "height": 180
          },
          "high": {
           "url": "https://i.ytimg.com/vi/V4zibaoGjXY/hqdefault.jpg",
           "width": 480,
           "height": 360
          }
         },
         "channelTitle": "Stefan Mischook",
         "liveBroadcastContent": "none"
        }
       },
       {
        "kind": "youtube#searchResult",
        "etag": "\"p4VTdlkQv3HQeTEaXgvLePAydmU/dauQpyKfWANOIQae1KLfZZ-NNmg\"",
        "id": {
         "kind": "youtube#video",
         "videoId": "gTBCHu0btn8"
        },
        "snippet": {
         "publishedAt": "2016-06-28T17:54:15.000Z",
         "channelId": "UCcabW7890RKJzL968QWEykA",
         "title": "Ruby on Rails by Leila Hofer",
         "description": "Ruby on rails is an open source web development framework that is one of the most popular frameworks on the web. Rails has a lot to offer, but this seminar will ...",
         "thumbnails": {
          "default": {
           "url": "https://i.ytimg.com/vi/gTBCHu0btn8/default.jpg",
           "width": 120,
           "height": 90
          },
          "medium": {
           "url": "https://i.ytimg.com/vi/gTBCHu0btn8/mqdefault.jpg",
           "width": 320,
           "height": 180
          },
          "high": {
           "url": "https://i.ytimg.com/vi/gTBCHu0btn8/hqdefault.jpg",
           "width": 480,
           "height": 360
          }
         },
         "channelTitle": "CS50",
         "liveBroadcastContent": "none"
        }
       }
      ]
     }     
  end

  def get_full_details(ids)
    yt = YoutubeInteractor.new('', ids)
    yt.get_details
  end
end
