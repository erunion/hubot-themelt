# Description:
#   What's today The Melt special?
#
# Dependencies:
#   "cheerio": "^0.17.0"
#
# Commands:
#   hubot melt - Pulls today's The Melt special
#
# Author:
#   jonursenbach

cheerio = require 'cheerio'

module.exports = (robot) =>
  robot.respond /melt/i, (msg) ->
    msg.http('https://themelt.com/menu')
      .get() (err, res, body) ->
        return msg.send "Sorry, The Melt doesn't like you. ERROR:#{err}" if err
        return msg.send "Unable to get today's special: #{res.statusCode + ':\n' + body}" if res.statusCode != 200

        $ = cheerio.load(body)

        emit = 'Today\'s The Melt Special is:' + '\n'
        emit += $('div.lunchMarquee div.descDefault h5').text() + "\n"
        emit += $('div.lunchMarquee div.descDefault h6').text() + "\n"
        emit += $('div.lunchMarquee div.image.lunch img').attr('src')

        msg.send emit
