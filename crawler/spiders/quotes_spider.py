import scrapy






#scrapy crawl quotes -o quotes-humor.json -a tag=humor
# scrapy crawl quotes -o quotes.json

class QuotesSpider(scrapy.Spider):
    name = "quotes"

    def start_requests(self):
        url = 'http://quotes.toscrape.com/'
        tag = getattr(self, 'tag', None)
        if tag is not None:
            url = url + 'tag/' + tag
        yield scrapy.Request(url, self.parse)

    def parse(self, response):
        for quote in response.css('div.quote'):
            yield {
                'text': quote.css('span.text::text').extract_first(),
                'author': quote.css('small.author::text').extract_first(),
            }

        next_page = response.css('li.next a::attr(href)').extract_first()
        if next_page is not None:
            yield response.follow(next_page, self.parse)


class BlueSpider(scrapy.Spider):
    name = "blue"

    def start_requests(self):
        urls = [
            'http://quotes.toscrape.com/page/1/',
            'http://quotes.toscrape.com/page/2/',
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        for quote in response.css('div.quote'):
            yield {
                'text': quote.css('span.text::text').extract_first(),
                'author': quote.css('small.author::text').extract_first(),
                'tags': quote.css('div.tags a.tag::text').extract(),
            }

        next_page = response.css('li.next a::attr(href)').extract_first()
        if next_page is not None:
            yield response.follow(next_page, callback=self.parse)

class ASCIISpider(scrapy.Spider):
    name = 'ascii_test'
    #http://ricostacruz.com/cheatsheets/xpath.html

    def start_requests(self):
        url='http://www.asciiworld.com/-Animals-.html'
        #url = 'http://www.asciiworld.com/'
        yield scrapy.Request(url, self.parse)

    def parse(self, response):
        #for main page
        #s = response.selector.xpath('//td[@id="blocGauche"]/div[1]')[0]
        #categories = s.xpath('//div[@class="bloc menu"]/div/a[@class="mot"]/@href').extract()

        # sub_menu = response.selector.xpath('//td[@id="blocCentre"]/div/div/table').extract()[0]
        ascii_tables = response.selector.xpath('//td[@id="blocCentre"]/div/div/table')[1]
        # ascii_arts = ascii_tables.xpath('//table/*/*/pre').extract()
        ascii_arts = ascii_tables.xpath('//table/tr/td/pre/text()').extract()
        # figure out how to join h4 and pre together in object when extracting
        # atable.xpath('//table/tr/td/h4/text()')


        for aa in ascii_arts:
            yield {
                'text': aa,
                'url': response.url,
            }

        # next_page = response.css('li.next a::attr(href)').extract_first()
        # if next_page is not None:
        #     yield response.follow(next_page, self.parse)
