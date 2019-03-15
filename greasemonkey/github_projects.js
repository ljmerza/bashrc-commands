// ==UserScript==
// @name         Github Projects
// @namespace    kanban projects
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://github.com/ljmerza/kanban/projects/*
// @require      https://code.jquery.com/jquery-3.3.1.min.js
// @grant        none
// ==/UserScript==

(function() {
    setInterval(() => {
        $('.issue-card').each(function(){
            const text = $(this).find('.js-comment-body p').text();
            $(this).find('small').hide();

            let cardColor = '';
            let cardTextColor = '';

            if(/^ha:/.test(text)) {
                cardColor = '932B2B';
                cardTextColor = 'FFBCBC';

            } else if(/^website:/.test(text)) {
                cardColor = '93752B';
                cardTextColor = 'FFECBC';

            } else if(/^book:/.test(text)) {
                cardColor = '237523';
                cardTextColor = '99D099';

            } else if(/^life:/.test(text)) {
                cardColor = '4B2162';
                cardTextColor = 'A184B0';

            } else if(/^blog:/.test(text)) {
                cardColor = '4B2162';
                cardTextColor = 'A184B0';

            } else if(/^job:/.test(text)) {
                cardColor = '243662';
                cardTextColor = '8793B1';

            } else if(/^movie:/.test(text)) {
                cardColor = '804315';
                cardTextColor = 'FFCFAA';
            }

            if(cardColor && cardTextColor){
              $(this).attr('style', `background-color: #${cardColor} !important; color: #${cardTextColor} !important`);
              $(this).find('svg path').css({fill: `#${cardTextColor}`});
            }

        })
    },500)


})($);