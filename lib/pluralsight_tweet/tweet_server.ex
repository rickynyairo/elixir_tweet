defmodule PluralsightTweet.TweetServer do 
    use GenServer
    # Gen server is a behaviour that we want to implement
    def start_link(_) do 
        # call the startlink function in the GenServer module
        # pass the module name and the name of the server 
        # this will call the init function
        GenServer.start_link(__MODULE__, :ok, name: :tweet_server)
    end

    def init(:ok) do 
        # the second part of the tuple is the initial state of the server
        # for restarting incase of failure
        {:ok,  %{}}
    end

    def handle_cast({:search, search_string}, _) do 
        # this function is called asyncronously
        PluralsightTweet.Tweet.search(search_string)
        {:noreply, %{}}
    end

    def search(search_string) do 
        GenServer.cast(:tweet_server, {:search, search_string})
    end
end