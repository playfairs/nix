{
  pkgs,
  ...
}:
{
  stylix.targets = {
    nixcord.enable = false;
    vencord.enable = false;
  };

  programs.nixcord = {
    enable = true;
    discord = {
      enable = !(pkgs.stdenv.hostPlatform.isLinux && pkgs.stdenv.isAarch64);
      equicord.enable = true;
    };
    equibop.enable = true;
    vesktop.enable = (pkgs.stdenv.hostPlatform.isLinux && pkgs.stdenv.isAarch64);
    quickCss = import ./quickcss.nix;

    config = {
      frameless = true;
      transparent = true;

      plugins = {
        advancedPermissions.enable = true;
        animalese = {
          volume = 1.0;
          speed = 1.25;
          pitch = 1.25;
          messageLengthLimit = 1000000;
        };
        appleMusicRichPresence = {
          enable = true;
          refreshInterval = 1.0;
          activityType = 2;
          enableButtons = false;
          stateString = "{artist}";
          largeImageType = "Artist";
          smallImageType = "Disabled";
          largeImageLink = "Artist";
        };
        betterAudioPlayer.enable = true;
        betterBlockedUsers.enable = true;
        betterFolders.enable = true;
        betterGifPicker.enable = true;
        callTimer = {
          enable = true;
          showWithoutHover = true;
          showRoleColor = true;
          trackSelf = true;
          showSeconds = true;
        };
        consoleShortcuts.enable = true;
        cursorBuddy = {
          buddy = "fathorse";
          speed = 50;
          fps = 500000;
          size = 500;
          shake = true;
        };
        customIdle = {
          idleTimeout = 0.0;
        };
        customRpc = {
          timestampMode = 3;
          appId = "1514735829216661614";
          appName = "GIMP";
          details = "";
          imageBig = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fseeklogo.com%2Fimages%2FG%2Fgimp-logo-60F50AE9E6-seeklogo.com.png&f=1&nofb=1&ipt=50d74778111067866d6118f9fa78f8118575269360969e8a9f7c1a4adb5119fe";
          state = "";
          buttonOneText = "";
          buttonOneUrl = "";
          buttonTwoText = "";
          buttonTwoUrl = "";
          imageBigTooltip = "GNU Image Manipulation Program";
          imageSmall = "";
          imageSmallTooltip = "";
          detailsUrl = "";
        };
        declutter = {
          enable = true;
          removeNameplate = true;
          removeClanTag = false;
          alwaysShowUsername = false;
          removeServerBoostInfo = false;
          removeBillingSettings = false;
          removeAudioMenus = false;
          removeButtonTooltips = true;
          removeQuestsAboveDms = true;
        };
        decor = {
          agreedToGuidelines = true;
        };
        disableCallIdle.enable = true;
        discordDevBanner = {
          format = "{buildChannel} {buildNumber} ({buildHash}) | {equicordName} {equicordVersion} ({equicordHash})";
        };
        equicordHelper = {
          enable = true;
          showYourOwnActivityButtons = true;
          refreshSlashCommands = true;
          accountStandingButton = true;
          restoreFileDownloadButton = true;
          noModalAnimation = true;
          disableAdoptTagPrompt = true;
        };
        equicordToolbox.enable = true;
        experiments = {
          enable = true;
          toolbarDevMenu = true;
        };
        expressionCloner.enable = true;
        fixCodeblockGap.enable = true;
        followVoiceUser = {
          enable = true;
          leaveWhenUserLeaves = false;
          onlyWhenInVoice = true;
        };
        fontLoader = {
          enable = true;
          selectedFont = "PT Sans Caption";
          applyOnCodeBlocks = true;
        };
        forceOwnerCrown.enable = true;
        fullSearchContext.enable = true;
        gameActivityToggle.enable = true;
        greetStickerPicker = {
          greetMode = "Message";
        };
        homeTyping.enable = true;
        imageFilename = {
          enable = true;
          showFullUrl = true;
        };
        instantScreenshare = {
          streamMedia = "screen:3:0";
        };
        limitlessScreenshare = {
          enable = true;
          maxResolution = 2000000;
        };
        memberCount.enable = true;
        messageBurst = {
          timePeriod = 5;
          useSpace = true;
        };
        messageLatency = {
          showMillis = true;
        };
        messageLinkEmbeds.enable = true;
        messageLogger = {
          collapseDeleted = true;
          deleteStyle = "overlay";
          ignoreSelf = true;
          showEditDiffs = true;
          separatedDiffs = true;
        };
        messageLoggerEnhanced = {
          saveImages = true;
          ignoreSelf = true;
          ignoreMutedGuilds = true;
          ignoreMutedCategories = true;
          ignoreMutedChannels = true;
          hideMessageFromMessageLoggers = true;
          showWhereMessageIsFrom = true;
          hideMessageFromMessageLoggersDeletedMessage = "redacted lol";
          imageCacheDir = "/Users/playfairs/Library/Application Support/Equicord/MessageLoggerData/savedImages";
          logsDir = "/Users/playfairs/Library/Application Support/Equicord/MessageLoggerData";
        };
        moreCommands = {
          uwuEveryMessage = true;
        };
        moreUserTags = {
          enable = true;
          tagSettings = {
            webhook = {
              showInNotChat = false;
            };
            owner = {
              showInNotChat = false;
            };
            administrator = {
              showInNotChat = false;
            };
            moderatorStaff = {
              showInNotChat = false;
            };
            moderator = {
              showInNotChat = false;
            };
            voiceModerator = {
              showInNotChat = false;
            };
            chatModerator = {
              showInNotChat = false;
            };
          };
          dontShowForBots = true;
        };
        musicControls = {
          enable = true;
          showSpotifyControls = true;
          lyricsProvider = "Spotify";
          translateTo = "en";
        };
        musicRichPresence = {
          statusName = "{artist}";
          nameFormat = "artist";
          useListeningStatus = true;
          username = "pdwk";
          apiKey = "cfc76b78c20ceebf40ec4457a6a6dd0c";
          scrobblerBackend = "lastfm";
          showLogo = false;
        };
        newGuildSettings = {
          messages = 2;
        };
        noOnboardingDelay.enable = true;
        noUnblockToJump.enable = true;
        openInApp.enable = true;
        permissionsViewer = {
          enable = true;
          permissionsSortOrder = 1;
        };
        pinDms = {
          enable = true;
          dmSectionCollapsed = true;
          canCollapseDmSection = true;
          userBasedCategoryList = {
            "1426711359059394662" = [
              {
                id = "13i1kveardfm";
                name = "1";
                color = 6323595;
                collapsed = true;
                channels = [ "1509429165286494323" ];
              }
              {
                id = "z8962eq42km";
                name = "2";
                color = 9807270;
                collapsed = true;
                channels = [
                  "1436486310171902132"
                  "1446185146511261842"
                  "1434755744741326888"
                  "1440541549179174955"
                  "1429168427767042150"
                  "1445526193603481632"
                  "1476719221084913677"
                  "1530905009355751466"
                  "1428676537212997764"
                  "1428674542062010449"
                  "1428868922228215911"
                  "1515320366862696582"
                  "1548876504136687746"
                  "1535824149166035024"
                ];
              }
            ];
            "1427809899630563428" = [ ];
            "816725924959354890" = [
              {
                id = "9jxoc563ri7";
                name = "+";
                color = 10070709;
                collapsed = true;
                channels = [ "1448047910284558376" ];
              }
            ];
          };
        };
        platformIndicators = {
          enable = true;
          list = false;
          messages = false;
          consoleIcon = "vencord";
        };
        polishWording = {
          fixCapitalization = true;
          fixPunctuationFrequency = 9.805778359481554;
        };
        previewMessage.enable = true;
        profileSets.enable = true;
        questify = {
          enable = false;
          autoCompleteQuestTypes = {
            PLAY_ON_DESKTOP = true;
            PLAY_ON_XBOX = true;
            PLAY_ON_PLAYSTATION = true;
            PLAY_ACTIVITY = true;
            WATCH_VIDEO = true;
            WATCH_VIDEO_ON_MOBILE = true;
            ACHIEVEMENT_IN_ACTIVITY = false;
          };
          questButtonIncludedTypes = {
            "1" = false;
            "2" = false;
            "3" = false;
            "4" = true;
            "5" = true;
            WATCH_VIDEO = true;
            WATCH_VIDEO_ON_MOBILE = true;
            ACHIEVEMENT_IN_ACTIVITY = true;
            ACHIEVEMENT_IN_GAME = true;
            PLAY_ACTIVITY = true;
            PLAY_ON_DESKTOP = true;
            PLAY_ON_DESKTOP_V2 = true;
            STREAM_ON_DESKTOP = true;
            PLAY_ON_PLAYSTATION = true;
            PLAY_ON_XBOX = true;
          };
          questButtonBadgeCount = 8;
          allowChangingDangerousSettings = true;
          autoCompleteQuestsSimultaneously = true;
        };
        readAllNotificationsButton.enable = true;
        relationshipNotifier = {
          enable = true;
          notices = true;
        };
        reverseImageSearch.enable = true;
        reviewDb.enable = true;
        roleColorEverywhere.enable = true;
        rpcEditor.enable = true;
        saveFavoriteGifs.enable = true;
        serverInfo.enable = true;
        serverListIndicators = {
          enable = true;
          mode = 1;
          useCompact = true;
        };
        shikiCodeblocks = {
          enable = true;
          # theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/refs/heads/main/packages/tm-themes/themes/rose-pine-moon.json";
        };
        showHiddenChannels = {
          showMode = 1;
        };
        showMeYourName = {
          triggerNameRerender = true;
          messages = false;
          discriminators = false;
          hideDefaultAtSign = true;
          animateEffects = true;
          includedNames = "{friend, nick} [{display}] (@{user})";
        };
        silentTyping = {
          enable = true;
          disabledLocations =
            "1423761407836688425, 1363228176075063376, 1376698576729538591, "
            + "1425938735245164667, 1425906499653210142, 1451450861468254219, "
            + "1453238300025421928, 1453926202711605281, 1434475762584387604, "
            + "1458521730145321234, 1461594500995612727, 1446185146511261842, "
            + "1431046537710145561, 1428676537212997764, 741347063077535874, "
            + "821660746453745694, 1462965053446951045, 1462565517733793813, "
            + "1362681460393512980, 1469741187656192135, 1463314502761316383, "
            + "1473357976378015869, 1474137410899022051, 1475971431757254678, "
            + "1480591016254771260, 1453520009409331436, 1399367450134319189, "
            + "1405628265896480778, 1491132220985966693, 1470203665267556453, "
            + "1493122984355958866, 1487058904146903111, 1494567231911104557, "
            + "1456222664770326558, 1495178522833064050, 1456933645624541252, "
            + "909458221419356210, 1506098639775203358, 1456025489872519254, "
            + "1337175559549227018, 1502097023770300587, 1508220366525300836, "
            + "1369783263152832633, 1509308788379881566, 1498175948628164728, "
            + "1439045920783073322, 1509429165286494323, 1436486310171902132, "
            + "1469597149103915039, 1428830217123659777, 1520857992344375442, "
            + "1520885135510077571, 1441515164439416935, 1521006493330178109, "
            + "1429176077078761605, 1491491957736997065, 1462194524473266206, "
            + "1523712962072936559, 1524358813560606754, 985697696830619678, "
            + "1524832111146700852, 1429959176339193876, 1516601223221088289, "
            + "1526374524382089296, 1515983616444862507, 1527090082358497345, "
            + "1527281651942686871, 1524583007803936919, 1527607118931300352, "
            + "1436418354461020286, 1499602542471155873, 1529456436617150541, "
            + "1530905009355751466, 1524496247405154526, 1532146759726399600, "
            + "1517027744716685332, 1173279887985999985, 1533552211819495526, "
            + "1420619733945946173";
        };
        songSpotlight = {
          collapseSongList = true;
        };
        sortFriends = {
          enable = true;
          showDates = true;
        };
        spotifyControls = {
          useSpotifyUris = true;
        };
        spotifyCrack = {
          enable = true;
          keepSpotifyActivityOnIdle = true;
        };
        spotifyShareCommands.enable = true;
        streamerModeOnStream.enable = false;
        textReplace = {
          stringRules = [
            {
              find = "";
              replace = "";
              onlyIfIncludes = "";
            }
          ];
          regexRules = [
            {
              find = "";
              replace = "";
              onlyIfIncludes = "";
            }
          ];
        };
        themeLibrary = {
          enable = true;
          hideWarningCard = true;
        };
        timezones = {
          enable = true;
          askedTimezone = true;
        };
        title.enable = true;
        translate = {
          enable = true;
          sentOutput = "af";
          dismissedAutoTranslateAlert = true;
        };
        triviaAi = {
          systemPrompt = "You are a helpful assistant who answers questions for the user in a concise and short way while using the least amount of words and punctuation.";
        };
        typingTweaks = {
          showAvatars = false;
        };
        unsuppressEmbeds.enable = true;
        userPfp = {
          preferNitro = false;
        };
        validReply.enable = true;
        validUser.enable = true;
        viewIcons = {
          enable = true;
          format = "png";
          imgSize = "4096";
        };
        voiceButtons = {
          enable = true;
          showChatButton = false;
          showMuteButton = false;
          serverSelf = true;
          buttonPosition = "right";
        };
        voiceMessages = {
          enable = true;
          noiseSuppression = false;
          echoCancellation = false;
        };
        volumeBooster = {
          enable = true;
          multiplier = 5.0;
        };
        waitForSlot.enable = true;
        whosWatching.enable = true;
      };
    };
    extraConfig.plugins = {
      AllCallTimers = {
        format = "stopwatch";
      };
      Anammox = {
        dms = true;
        billing = true;
        gift = true;
        emojiList = true;
      };
      AutoReactions = {
        reactions = "<:l_SOB:1463629062059720872>";
        reactToOwnMessages = true;
        ignoredGuilds = "961097369817071626";
        allowedUsers = "1347441071323480074, 1426711359059394662";
        rateLimitDelay = 500;
      };
      betterFolders = {
        nestedFolders = { };
        enableNestedFolders = false;
      };
      BetterGifLoad = {
        enable = true;
        gifQuality = 1;
      };
      moreQuickReactions = {
        enable = true;
        frequentEmojis = true;
        compactMode = false;
        columns = 4;
        scroll = true;
        rows = 2;
      };
      BulkDeleteMessages = {
        enable = true;
        deleteLimit = 100.3240463527174;
        excludeMessageIds = "";
      };
      customCommands = {
        clyde = true;
      };
      equicordHelper = {
        disableCreateDMButton = false;
        disableDMContextMenu = false;
        noDefaultHangStatus = false;
      };
      fakeNitro = {
        useHyperLinks = true;
      };
      FavoritePlugins = {
        enable = true;
        favoritePlugins = "BetterFolders";
      };
      Freaky = {
        enable = true;
        addFreakyEnding = true;
      };
      ghosted = {
        scary = true;
      };
      globalBadges = {
        showPrefix = true;
        showSuffix = false;
      };
      GuildTagSettings = {
        hideTags = false;
        disableAdoptTagPrompt = true;
      };
      messageClickActions = {
        requireModifier = false;
        enableDoubleClickToReply = true;
        enableDoubleClickToEdit = true;
        enableDeleteOnClick = true;
        enableTripleClickToReact = false;
        backspaceClickAction = "delete";
        keySelection = "backspace";
      };
      musicControls = {
        showYoutubeMusicControls = false;
        YoutubeMusicApiUrl = "http://localhost:26538";
      };
      musicRichPresence = {
        shareSong = true;
        showLastFmLogo = true;
      };
      NoMoreEarrape = {
        enable = true;
        dbThreshold = -51;
        action = "mute";
        volumeReduction = 50;
      };
      permissionsViewer = {
        defaultPermissionsDropdownState = true;
      };
      QuestionMarkReplacement = {
        replace = ":face_with_monocle:";
      };
      RPCStats = {
        statDisplay = 0;
        lastFMApiKey = "";
        RPCTitle = "RPCStats";
        assetURL = "";
        lastFMUsername = "";
        albumCoverImage = true;
        lastFMStatFormat = "Top album this week: \"$album - $artist\"";
      };
      showHiddenChannels = {
        hideUnreads = true;
      };
      showHiddenThings = {
        disableDiscoveryFilters = true;
        disableDisallowedDiscoveryFilters = true;
      };
      showMeYourName = {
        mode = "nick-user";
        displayNames = false;
        inReplies = false;
        friendNicknames = "dms";
      };
      sidebarChat = {
        patchCommunity = true;
      };
      silentTyping = {
        isEnabled = true;
        showIcon = true;
        contextMenu = true;
      };
      SoundBoardLogger = {
        enable = true;
        soundVolume = 0.5;
        FileType = ".ogg";
      };
      SpotifyActivityToggle = {
        enable = true;
        location = "PANEL";
      };
      TiktokTTS = {
        enable = true;
        volume = 50;
      };
      translate = {
        showChatBarButton = true;
        showAutoTranslateAlert = false;
      };
      triviaAi = {
        autoRespond = false;
      };
      VencordRPC = {
        userAvatarAsSmallImage = false;
        exposeDmsUsername = false;
        type = 0;
        timestampMode = 0;
        secretStuff = "";
      };
    };
  };
}
