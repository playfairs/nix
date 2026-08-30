''
  /**
     * @name Rosé Pine Default
     * @author Playairs
     * @authorLink https://github.com/playfairs
     * @description Soho vibes for discord.
     * @license GPLv3
     * @version 1.2.6
     * @authorId 816725924959354890
     * @discord playfairs
     **/

  /** Rosé Pine color palette

  --color-base: #191724;
  --color-surface: #1f1d2e;
  --color-overlay: #26233a;
  --color-muted: #6e6a86;
  --color-subtle: #908caa;
  --color-text: #e0def4;
  --color-love: #eb6f92;
  --color-gold: #f6c177;
  --color-rose: #ebbcba;
  --color-pine: #31748f;
  --color-foam: #9ccfd8;
  --color-iris: #c4a7e7;
  --color-highlight-low: #21202e;
  --color-highlight-med: #403d52;
  --color-highlight-high: #524f67;

  **/


  .wrapper__6e9f8[data-list-item-id="guildsnav___home"] .childWrapper__6e9f8 {
      background-image: url("https://raw.githubusercontent.com/rose-pine/rose-pine-theme/main/assets/icon.png") !important;
      background-size: 100%;
      background-repeat: no-repeat;
      background-position: center;
      background-color: transparent !important;
  }

  .wrapper__6e9f8[data-list-item-id="guildsnav___home"] svg {
      display: none !important;
  }

  /**
      * This bit allows for the home button to change even with a custom icon,
      * this is needed for the plugin to work with custom icons.

      I don't know how to disable just the icon without tampering with the CSS.
      **/
  .wrapper__6e9f8.vc-home-typing[data-list-item-id="guildsnav___home"] .childWrapper__6e9f8 {
      background-image: none !important;
  }
  .wrapper__6e9f8.vc-home-typing[data-list-item-id="guildsnav___home"] svg {
      display: block !important;
  }

  .visual-refresh,
  .visual-refresh .theme-midnight,
  .visual-refresh .theme-dark,
  .visual-refresh .theme-ash,
  .visual-refresh .theme-light {
      --bg-brand: #ebbcba !important;
      --background-base-lower: #181624 !important;
      --background-base-lowest: #191724 !important;
      --background-base-low: #1f1d2e !important;
      --background-primary: #1f1d2b !important;
      --background-secondary: #191822 !important;
      --background-tertiary: #1f1d2c !important;
      --bg-base-tertiary: #191724 !important;
      --bg-base-primary: #1f1d2b !important;
      --bg-base-secondary: #1d1b2b !important;
      --bg-surface-overlay: #171524 !important;
      --bg-surface-raised: #171524 !important;
      --background-surface-high: #1c1929 !important;
      --background-surface-higher: #1e1b2c !important;
      --background-surface-highest: #1b1825 !important;
      --background-secondary-alt: #1b1825 !important;
      --background-floating: #19162b !important;
      --card-primary-bg: #191724 !important;
      --custom-channel-members-bg:  !important;
      --user-profile-overlay-background: #ffffff05 !important;

      --chat-background-default: #1f1d2e !important;

      --autocomplete-bg: #1b1927 !important;

      --modal-footer-background: #1a1927 !important;
      --modal-background: #161622 !important;

      --notice-background-positive: #9ccfd822 !important;
      --notice-background-critical: #eb6f9222 !important;
      --notice-background-warning: #f6c17722 !important;
      --background-mod-subtle:  !important;

      --text-normal: #e0def4 !important;
      --header-primary: #e0def4 !important;
      --interactive-active: #e0def4 !important;
      --header-secondary: #908caa !important;
      --text-primary: #e0def4 !important;
      --text-feedback-positive: #9ccfd8 !important;
      --text-positive: #31748f !important;
      --text-code-keyword: #eb6f92 !important;
      --text-code-string: #9ccfd8 !important;
      --text-code-title: #31748f !important;
      --text-code-variable: #9ccfd8 !important;
      --green-400: #31748f !important;
      --button-secondary-text: #cecacd;
      --text-link: #31748f !important;
      --text-tertiary: #908caa !important;
      --text-default: #e0def4 !important;
      --channels-default: #908caa !important;
      --interactive-hover: #908caa !important;
      --embed-title: var(--header-primary) !important;
      --user-profile-border: #26233a !important;
      --green-330: #9ccfd877 !important;
      --green-360: #31748f !important;
      --red-400: #eb6f92;
      --opacity-blurple-16: #eb6f9216;

      --button-outline-danger-background: #eb6f9222 !important;
      --button-outline-danger-background-hover: #eb6f9233 !important;
      --button-outline-danger-text: #eb6f92 !important;
      --button-outline-danger-text-hover: var(
          --button-outline-danger-text
      ) !important;
      --button-filled-brand-background: #c4a7e722 !important;
      --button-filled-brand-background-hover: #c4a7e733 !important;
      --button-filled-brand-text: #c4a7e7 !important;
      --button-filled-brand-text-hover: var(
          --button-outline-danger-text
      ) !important;
  }

  /*.custom-user-profile-theme .themeColor_fb7f94.secondary_fb7f94 {
      background: rgba(155, 155, 155, 0.1) !important;
      border: none;
  }

  .button_fb7f94.button__201d5.lookFilled__201d5.colorPrimary__201d5.themeColor_fb7f94.primary_fb7f94.sizeSmall__201d5.grow__201d5 {
      background: #c4a7e722 !important;
      color: #c4a7e7 !important;
      font-weight: 600 !important;
      border: none !important;
  }

  .button_fb7f94.button__201d5.lookFilled__201d5.colorPrimary__201d5.themeColor_fb7f94.primary_fb7f94.sizeSmall__201d5.grow__201d5:hover {
      background: #c4a7e744 !important;
      color: #c4a7e7 !important;
      font-weight: 600 !important;
      border: none !important;
  }

  .button_fb7f94.button__201d5.lookFilled__201d5.colorPrimary__201d5.themeColor_fb7f94.primary_fb7f94.sizeSmall__201d5.grow__201d5:active {
      background: #c4a7e766 !important;
      color: #c4a7e7 !important;
      font-weight: 600 !important;
      border: none !important;*/
  }

  .visual-refresh
      .tabBar__133bf
      .addFriend__133bf.addFriend__133bf.addFriend__133bf:hover {
      background-color: #c4a7e722;
  }

  .visual-refresh
      .tabBar__133bf
      .addFriend__133bf.addFriend__133bf.addFriend__133bf:active {
      background-color: #c4a7e733;
  }

  .visual-refresh
      .tabBar__133bf
      .addFriend__133bf.addFriend__133bf.addFriend__133bf {
      color: #c4a7e7;
      background: none;
  }

  .visual-refresh
      .tabBar__133bf
      .addFriend__133bf.addFriend__133bf.addFriend__133bf[aria-selected="true"] {
      background-color: #c4a7e716;
      color: #c4a7e7;
  }

  .dark img[aria-label="Domain"],
  .dark img[alt="GitHub Logo"], .dark img[alt="Steam Logo"],
  .dark img[alt="X Logo"] {
      filter: invert() !important;
  }

  .container_a99829 {
      background: #ffffff10 !important;
  }

  .outer_c0bea0.user-profile-popout,
  :root .user-profile-modal,
  :root .user-profile-popout,
  .outer_c0bea0.user-profile-sidebar {
      background: #1f1d2e !important;
      --profile-gradient-start: #1f1d2e !important;
      --profile-gradient-end: #1f1d2e !important;
      padding: 0 !important;
      --profile-gradient-primary-color: #1f1d2e !important;
      --profile-gradient-secondary-color: #1f1d2e !important;
      --profile-gradient-overlay-color: #1f1d2e !important;
      --profile-gradient-primary-color: #e0def4 !important;
      --profile-gradient-primary-color: #1f1d2e !important;
      --profile-gradient-primary-color: #1f1d2e !important;
      --profile-gradient-primary-color: #1f1d2e !important;
  }

  .visual-refresh {
      --custom-channel-textarea-text-area-height: 50px;
      .form_f75fb0 {
          margin: 0 5px 5px 5px;
          padding: 0;
          --chatbar-border-color: var(--border-faint);
      }
      .channelTextArea_f75fb0 {
          margin: 0;
          border-color: var(--chatbar-border-color);
          transition: none;
      }
      .base_b88801 {
          top: -24px;
          left: 0;
          right: 0;
          background-color: var(--chat-background-default);
          padding: 0 8px;
          border-radius: var(--radius-sm) var(--radius-sm) 0 0;
          border: 1px solid var(--chatbar-border-color);
          border-bottom: none;
          transition: none;
          box-sizing: border-box;
      }
      .stackedBars__74017,
      .threadSuggestionBar__841c8 {
          border-color: var(--chatbar-border-color) !important;
      }
      .form_f75fb0:has(.base_b88801) {
          .channelTextArea_f75fb0 {
              border-radius: 0 0 var(--radius-sm) var(--radius-sm);
          }
      }
      .form_f75fb0:has(.channelTextArea__74017:focus-within) {
          --chatbar-border-color: var(--border-subtle);
      }
      .scrollerSpacer__36d07 {
          height: calc(24px + 8px);
      }
      .scroller__36d07::-webkit-scrollbar-track {
          margin-bottom: calc(20px + 8px);
      }
      .bottomBar__0f481 {
          margin-bottom: 24px;
      }
      .wrapper__44df5 {
          margin: 0;
          border-radius: var(--radius-sm);
      }
  }

  .outer_c0bea0 .inner_c0bea0 .backgroundImage__9c3be {
      display: none;
  }

  .footerButtonColor__7f9c0 {
      color: #908caa;
  }


      /* Fuckass profile color thingy don't turn this shit on */
      /* keep 'custom-user-profile-theme' off */

  /* .custom-user-profile-theme .container_a99829 { */
  /* border: 2px solid var(--input-border) !important; */
  /* } */

  /* .custom-user-profile-theme .themeColor_fb7f94.primary_fb7f94 { */
  /* background: #1f1d2e; */
  /* } */

  .wrapper__44b0c[role="img"] > svg > circle {
      fill: none;
  }

  /* .custom-user-profile-theme .inner_c0bea0 { */
      /* --profile-gradient-start: #1f1d2e !important; */
      /* --profile-gradient-end: #1f1d2e !important; */
      /* background: #1f1d2e !important; */
  /* } */

  /* .outer_c0bea0.user-profile-modal-v2.custom-theme-background.custom-user-profile-theme { */
      /* --profile-gradient-primary-color: none !important; */
      /* --profile-gradient-secondary-color: none !important; */
      /* --profile-gradient-overlay-color: none !important; */
      /* --profile-gradient-button-color: none !important; */
      /* --profile-gradient-modal-background-color: none !important; */
      /* --custom-theme-base-color-amount: none !important; */
      /* --custom-theme-text-color-amount: none !important; */
      /* --custom-theme-text-color-light: none !important; */
      /* --custom-theme-base-color-dark-hsl: none !important; */
      /* --custom-theme-base-color-dark: none !important; */
      /* --custom-theme-text-color-dark: none !important; */
  /* } */

  #vc-spotify-progress-bar > [class^="slider"]:hover [class^="barFill"] {
      background-color: #ebbcba !important;
  }

  .vc-spotify-repeat-context,
  .vc-spotify-repeat-track,
  .vc-spotify-shuffle-on {
      background-color: #ebbcba22 !important;
  }

  .vc-spotify-repeat-context svg,
  .vc-spotify-repeat-track svg,
  .vc-spotify-shuffle-on svg {
      color: #ebbcba !important;
      fill: #ebbcba !important;
      stroke: #ebbcba !important;
  }

  .vcd-screen-picker-option-radio[data-checked="true"] {
      background-color: var(--button-filled-brand-background) !important;
      border-color: var(--button-filled-brand-background) !important;
      color: var(--button-filled-brand-text) !important;
  }

  div.stack_dbd263 > .title__3e443,
  div.stack_dbd263 > div > div > h3,
  div.stack_dbd263 > div > div > div > div[role="radiogroup"],
  div.stack_dbd263 > div > div > div > div.divider__46c3b.divider_fbfab6 {
      display: none !important;
  }

  .avatar__68617.speaking__68617 {
      box-shadow:
          inset 0 0 0 2px #ebbcba,
          inset 0 0 0 3px var(--bg-base-secondary) !important;
  }

  .avatarSpeaking__44b0c {
      box-shadow:
          inset 0 0 0 2px #ebbcba,
          inset 0 0 0 3px var(--bg-base-secondary) !important;
  }

  .border_f910d0.speaking_f910d0 {
      box-shadow:
          inset 0 0 0 2px #ebbcba,
          inset 0 0 0 3px var(--bg-base-secondary) !important;
  }

  .border__2f4f7.speaking__2f4f7 {
      box-shadow:
          inset 0 0 0 2px #ebbcba,
          inset 0 0 0 3px var(--bg-base-secondary) !important;
  }

  .buttonSection__1405b {
      background-color: #1c1b25;
  }

  button.button__67645.redGlow__67645,
  span.button__67645.redGlow__67645 {
      background-color: #eb6f9221 !important;
  }

  button.button__67645.redGlow__67645 svg path {
      fill: #eb6f92 !important;
      stroke: #eb6f92 !important;
  }

  .addFriendInputWrapper__72ba7 {
      background-color: var(--background-base-low);
  }

  .container__87bf1.checked__87bf1 {
      background-color: #c4a7e799 !important;
  }

  .container__87bf1 {
      background-color: #26233a !important;
  }

  .experimentButton_e131a9 .buttonColor_e131a9.buttonActive_e131a9,
  .experimentButton_e131a9.buttonColor_e131a9.buttonActive_e131a9,
  .custom-theme-background
      .experimentButton_e131a9
      .buttonColor_e131a9.buttonActive_e131a9,
  .custom-theme-background
      .experimentButton_e131a9.buttonColor_e131a9.buttonActive_e131a9 {
      background-color: #9ccfd833 !important;
  }

  .container_d1d9f3 circle {
      fill: #1f1d2e;
  }

  .callContainer_cb9592.theme-dark.theme-midnight {
      background: #191822 !important;
  }

  rect[mask="url(#svg-mask-status-online)"] {
      fill: #9ccfd8;
  }

  rect[mask="url(#svg-mask-status-offline)"] {
      fill: #908caa;
  }

  rect[mask="url(#svg-mask-status-idle)"] {
      fill: #f6c177;
  }

  rect[mask="url(#svg-mask-status-dnd)"] {
      fill: #eb6f92;
  }

  .midnightIcon__36dee {
      background-color: #1f1d2e;
  }

  .theme-dark #vc-spotify-player {
      background-color: var(--background-base-high);
  }

  .bar_c38106.shortBar_c38106 {
      display: #000000;
  }

  .buttonSection__1405b.experimentButtonSection__1405b {
      background: #1e1b2c;
  }

  .visual-refresh .root_bfe55a {
      border-radius: 1px;
      overflow: hidden;
      background-color: var(--background-tertiary);
  }

  .gradientContainer_bfe55a {
      background-image: none !important;
  }

  .custom-user-profile-theme .tabBarItem__37bfc {
      --selected-tab-item-color: var(--text-primary) !important;
      color: #ffffff61 !important;
  }


  /* :root, */
  /* .visual-refresh, */
  /* .theme-dark, */
  /* .theme-light, */
  /* .theme-midnight, */
  /* .theme-ash { */
    /* --radius-sm: 5px !important; */
    /* --radius-md: 5px !important; */
    /* --radius-lg: 5px !important; */
    /* --radius-xl: 5px !important; */
  /* } */
  /* .visual-refresh * { */
    /* border-radius: 0px !important; */
  /* } */
''
