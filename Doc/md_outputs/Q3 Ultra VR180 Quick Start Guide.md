##### **Q3 Ultra VR180 Quick Start Guide**

Happy new year guys\! And here is my new year gift for our lovely community, my step by step guide for new q3u mod users, From unboxing, getting the one-time calibration done to watching your first VR180 video in a headset.

First, the camera is ready to use right away. Calibration is not baked into the recorded files. It only takes effect when you export from QooCam Studio. So don’t worry if you don’t get it perfect the first time, or if you skip it at the beginning. You can always calibrate later and re-export older footage with the updated calibration.

1\. My go-to settings  
Video: HLG 10-bit Pro, 8K 30p, full auto exposure. Only use Dynamic Range Boost outdoors.  
Photo: 96MP DNG \+ JPG.  
Keep everything else at default. Then just start shooting.  
2\. Take calibration photos (one-time)  
Go outside and take a few photos for calibration. Keep the camera level, and make sure there’s nothing close to the lenses in front of you.  
3\. Copy footage files to your computer  
If you’re using a Mac, install Android File Transfer first:  
[https://v3.kandaovr.com/.../21/13/AndroidFileTransfer.dmg...](https://v3.kandaovr.com/resource/kandao/app/2024/08/01/16/21/13/AndroidFileTransfer.dmg?fbclid=IwZXh0bgNhZW0CMTAAYnJpZBExM0R4ZEtmM0djcmZuMGR5VnNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR4LvlvHYH__1-_lx8RUWU4640uFKuyZBwnAaIi9-5kZFOn-dWOz78U6YompIA_aem_HIZ-f3ApnmCZCL5SLlRLug)  
4\. Install QooCam Studio and calibrate  
Download the latest QooCam Studio. In the menu, switch to 180 3D Normal. Import your first photos and videos.  
Open one of your calibration photos, turn off Horizontal Correction first, then click Calibration to complete the process. The calibration is stored on your computer and will apply to every export from this camera going forward.  
5\. Stabilization  
Enable stabilization if the video wasn’t shot on a tripod or monopod. Even if you used a gimbal, I still recommend enabling stabilization in most cases.  
6\. Color settings  
In the Color tab, I recommend HDR Rec2020 HLG. For Style, Shadow Boost is a good starting point, but feel free to explore other options.  
7\. Export settings  
For direct viewing in a headset or quick upload: H.265, Bitrate High.  
If you plan to edit or color grade: ProRes 422\.  
8\. Watch in a headset  
Apple Vision Pro: Kandao XR or Reality Player (I don’t recommend Moon Player for this).  
Meta Quest 3: DeoVR Player (set Rec2020 in DeoVR settings), or Skybox VR Video Player.

FAQ

1\. How do I put multiple clips together?  
You can use any NLE and edit it like a normal video. Just make sure you export in the original resolution. For a free option, I recommend Insta360 Studio. It’s the only free tool I know that can output 8K reliably.

You generally don’t need to worry about metadata. DeoVR and most VR players let you manually choose projection, just select 3D SBS 180\.

The exception is YouTube, which requires VR180 metadata injection using this tool:  
[https://drive.google.com/.../1PqvQldTX\_fPKu8…](https://drive.google.com/drive/folders/1PqvQldTX_fPKu8_GDpxA7jC3s76zvqsE?fbclid=IwZXh0bgNhZW0CMTAAYnJpZBExM0R4ZEtmM0djcmZuMGR5VnNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR4hQlQwN1wh9GUvmPA0Qp8hYd7O5eHl1kDbuNZNshUDBF0gufvJCpUwnc-qvg_aem_m_qlu3VgkWa5SmpjWsCHmA)

I don’t recommend uploading to YouTube because it often distorts the image (wavy ground or bent straight lines), and 8K streaming is inconsistent and unpredictable(I tried everything). In my experience, DeoVR is a much better option.

2\. What is calibration and why do I need it?  
Calibration corrects the small physical misalignment between the two lens/ sensor modules from manufacturing and the mod installation. It does this by shifting the left and right eye images(rotating the image sphere to be exact) to achieve proper 3D alignment. Because each lens captures over 190 degrees of FOV, there’s plenty of room to adjust without hurting image quality. If you skip calibration, you may feel discomfort or eye strain in a headset.

3\. Why am I seeing the lenses in my image?  
It’s normal for each lens to appear in the other lens’s view since the FOV is as wide as 180 degrees. Ideally, they show up evenly in the center.  
The latest QooCam Studio also includes an AI lens mask that should hide the lenses, so you shouldn’t see them after export when that is enabled.  
If you still see the lenses clearly, it’s usually a calibration issue. Try resetting calibration and running it again.  
Advanced manual calibration adjustment (optional):  
Windows: AppData\\Roaming\\QooCamStudio\\calibration  
Mac: /Users/(your user name)/Library/Application Support/QooCamStudio/calibration  
Find the folder with your camera serial number, open QUxxxxxxxxxx\_refined.xml, and adjust the three values in rig\_rotation (roll, tilt, pan).

4\. The view on the camera screen looks weird. Can I make it display SBS VR180?  
Yes, this is normal. The on-camera view is just a preview and doesn’t affect what gets recorded or what you’ll get after export.  
It’s possible to make the preview display SBS VR180, but it’s optional. Guide here:  
[https://www.facebook.com/share/p/1Bay2y6rLv/](https://m.facebook.com/groups/2104165716685522/permalink/2229082764193816/?__cft__[0]=AZbu5ct3htwsN12bPcMYyvO_Uothw7ni0H6o_jxvpNQsz1l0j4_LWH6TslZvE-ogL-cqt0pwohFpabmhWplBoomJybFRFsFor1ginC6RcJx2HCGXRLPQLlg3vJgFLC5FJ4mXS7IG3aB7bTMSF7GBi65DevzXjhmqug5ViQrGde892ubcuAdr-LMX9U6rsaafexMyL81TUSfPFYYgUOltQ_q4&__tn__=-UK-R)  
For more information about the camera itself, you can check out KanDao’s detailed user guide: [https://www.kandaovr.com/support/qoocam-3-ultra\#support\_detail\_user\_guide](https://www.kandaovr.com/support/qoocam-3-ultra?fbclid=IwZXh0bgNhZW0CMTAAYnJpZBExM0R4ZEtmM0djcmZuMGR5VnNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR4hQlQwN1wh9GUvmPA0Qp8hYd7O5eHl1kDbuNZNshUDBF0gufvJCpUwnc-qvg_aem_m_qlu3VgkWa5SmpjWsCHmA#support_detail_user_guide)  
This is for the original QooCam 3 Ultra but still 90% applies to our mods  
That is it for now, I will add more FAQs and update all the useful information for our first time Q3U mod users. Happy shooing\!  
