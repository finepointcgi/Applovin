extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func loadBanner():
	applovin_max.loadBanner("87b0755e7f024686",false,self.get_instance_id())

func loadReward():
	applovin_max.loadRewardedVideo("836f05bb0f876541",self.get_instance_id())

func loadInter():
	applovin_max.loadInterstitial("0cd1fa5a40df40ca",self.get_instance_id())

func _on_interstitial_loaded(id):
	applovin_max.showInterstitial(id)

func _on_interstitial_close(id):
	print("inter closed")

func _on_interstitial_failed_to_load(id,error):
	print("inter failed " + error)

func _on_rewarded_video_ad_loaded(id):
	applovin_max.showRewardedVideo(id)

func _on_rewarded_video_ad_completed(id):
	print("Completed Reward Video: " + id)
	coins += 1
	$RichTextLabel.text = coins


func _on_banner_loaded(id):
	applovin_max.showBanner(id)
	
func _on_banner_shown(id):
	yield(get_tree().create_timer(10),"timeout")
	applovin_max.removeBanner(id)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	loadBanner()
	pass # Replace with function body.


func _on_Button2_button_down():
	loadReward()
	pass # Replace with function body.


func _on_Button3_button_down():
	loadInter()
	pass # Replace with function body.
