import instaloader
from datetime import datetime
import os.path
from os import path
import os
from itertools import dropwhile, takewhile
import re
import csv




instagram = instaloader.Instaloader(
	quiet=False,
	download_pictures=False,
	download_videos=False,
	download_comments=True,
	download_geotags=False,
	download_video_thumbnails=False,
	compress_json=False,
	save_metadata=True
)

# instagram.login(user = os.getenv('INSTAGRAM_LOGIN'), passwd = os.getenv('INSTAGRAM_PW'))
# 
# instagram.save_session_to_file()
# 
# instagram.load_session_from_file(os.getenv('INSTAGRAM_LOGIN'))



def save_csv(save_path, results_posts):
	if not path.exists(save_path):
		with open(save_path, 'w', newline='', encoding='utf-8') as csvfile:
			fieldnames = [*results_posts[0].keys()]
			writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
			writer.writeheader()
	if path.exists(save_path):
		with open(save_path, 'a', newline='', encoding='utf-8') as csvfile:
			fieldnames = [*results_posts[0].keys()]
			writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
			for dictrow in results_posts:
				writer.writerow(dictrow)

def insta_posts_py(query, scope, max_posts, scrape_comments, save_path = "", since = "", until = ""):
	"""
	Run custom search

	Fetches data from Instagram via instaloader.
	"""
	# this is useful to include in the results because researchers are
	# always thirsty for them hashtags
	hashtag = re.compile(r"#([^\s,.+=-]+)")
	mention = re.compile(r"@([a-zA-Z0-9_]+)")

	queries = query.split(",")
	
	if since != "" and until != "":
		since = since.split("-")
		until = until.split("-")
		
		for item in range(len(since)):
			since[item] = int(since[item])
  
		for item in range(len(until)):
			until[item] = int(until[item])
  
		since = datetime(since[0], since[1], since[2])
		until = datetime(until[0], until[1], until[2])

  # return queries
	posts = []

	# for each query, get items
	for query in queries:
		chunk_size = 0
		print("Retrieving posts ('%s')" % query)
		query = query.replace("#", "")
		#chunk = instagram.get_hashtag_posts(query)
		hashtag_obj = instaloader.Hashtag.from_name(instagram.context, query)
		chunk = hashtag_obj.get_all_posts()

		# "chunk" is a generator so actually retrieve the posts next
		posts_processed = 0
		for post in chunk:
			chunk_size += 1
			print("Retrieving posts ('%s', %i posts)" % (query, chunk_size))
			posts.append(chunk.__next__())
				
	# go through posts, and retrieve comments
	results = []
	posts_processed = 0
	
	if since != "" and until != "":
		posts = takewhile(lambda p: p.date > until, dropwhile(lambda p: p.date > since, posts))

	for post in posts:
		results_posts = []
        
		posts_processed += 1
		# print("Retrieving metadata%s for post %i" % (comments_bit, posts_processed))

		thread_id = post.shortcode

		try:
			results_posts.append({
				"id": str(thread_id),
				"thread_id": str(thread_id),
				"parent_id": str(thread_id),
				"body": post.caption if post.caption is not None else "",
				"author": post.owner_username,
				"timestamp": post.date_utc.timestamp(),
				"type": "video" if post.is_video else "picture",
				"url": post.video_url if post.is_video else post.url,
				"thumbnail_url": post.url,
				"hashtags": ",".join(post.caption_hashtags),
				"usertags": ",".join(post.tagged_users),
				"mentioned": ",".join(mention.findall(post.caption) if post.caption else ""),
				"num_likes": post.likes,
				"num_comments": post.comments,
				"level": "post",
				"query": query
			})
		except (instaloader.QueryReturnedNotFoundException, instaloader.ConnectionException):
			pass

		if not scrape_comments==True:
			if save_path != "":
				save_csv(save_path, results_posts)
			results.append(results_posts)
			continue
                    
	return results
	
hashie = open("latest_hashtag.txt", "r").read()
# hashie = "hello"

path_to_be_saved = "data/" + hashie + ".csv"

insta_posts_py(hashie, scope = "hashtag", max_posts = 100, scrape_comments = False, save_path = path_to_be_saved)

# print(what)
