# set up video and canvas elements needed
class App.Face
  constructor: (video_element) ->
    @$el = $(video_element)
    @videoInput = @$el[0]
    @canvasInput = document.getElementById("compare")
    @canvasOverlay = document.getElementById("overlay")
    @debugOverlay = document.getElementById("debug")
    @overlayContext = @canvasOverlay.getContext("2d")
    # add some custom messaging
    @statusMessages =
      whitebalance: "checking for stability of camera whitebalance"
      detecting: "Detecting face"
      hints: "Hmm. Detecting the face is taking a long time"
      redetecting: "Lost track of face, redetecting"
      lost: "Lost track of face"
      found: "Tracking face, please keep still"
    
    @supportMessages =
      "no getUserMedia": "Unfortunately, <a href='http://dev.w3.org/2011/webrtc/editor/getusermedia.html'>getUserMedia</a> is not supported in your browser. Try <a href='http://www.opera.com/browser/'>downloading Opera 12</a> or <a href='http://caniuse.com/stream'>another browser that supports getUserMedia</a>. Now using fallback video for facedetection."
      "no camera": "No camera found. Using fallback video for facedetection."
    @setupEventListeners()
    @initializeTracker()
    
    return @

  start: ->
    @htracker.start()
  
  setupEventListeners: ->
    document.addEventListener "headtrackrStatus", ((event) =>
      if event.status of @supportMessages
        messagep = document.getElementById("gUMMessage")
        messagep.innerHTML = @supportMessages[event.status]
      else if event.status of @statusMessages
        messagep = document.getElementById("headtrackerMessage")
        messagep.innerHTML = @statusMessages[event.status]
        @$el.trigger('status',status: event.status, message: @statusMessages[event.status])
      return
    ), true

    # for each facetracking event received draw rectangle around tracked face on canvas
    document.addEventListener "facetrackingEvent", (event) =>
      # clear canvas
      @overlayContext.clearRect 0, 0, 640, 480
      if event.detection is "CS"
        # once we have stable tracking, draw rectangle
        @overlayContext.translate event.x, event.y
        @overlayContext.rotate event.angle - (Math.PI / 2)
        @overlayContext.strokeStyle = "#00CC00"
        @overlayContext.strokeRect (-(event.width / 2)) >> 0, (-(event.height / 2)) >> 0, event.width, event.height
        @overlayContext.rotate (Math.PI / 2) - event.angle
        @overlayContext.translate -event.x, -event.y

  initializeTracker: ->
    # the face tracking setup
    @htracker = new headtrackr.Tracker(
      altVideo:
        ogv: "./media/capture5.ogv"
        mp4: "./media/capture5.mp4"

      calcAngles: true
      ui: false
      headPosition: false
      debug: @debugOverlay
    )
    @htracker.init @videoInput, @canvasInput

  # turn off or on the canvas showing probability
  showProbabilityCanvas: ->
    debugCanvas = document.getElementById("debug")
    if debugCanvas.style.display is "none"
      debugCanvas.style.display = "block"
    else
      debugCanvas.style.display = "none"
    return