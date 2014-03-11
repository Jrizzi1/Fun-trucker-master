# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lipsum = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt tellus lectus, et tincidunt orci aliquet vitae. Vivamus orci dolor, elementum in libero et, malesuada pellentesque erat. Integer sodales et erat ac bibendum. Donec sit amet ligula at odio bibendum rutrum vitae et mauris. Vivamus consectetur purus ligula, non porta arcu vulputate vel. Suspendisse vitae felis ornare, placerat enim non, volutpat nunc. Donec venenatis bibendum eleifend. Nulla eu dignissim eros, in imperdiet metus. Suspendisse auctor, velit vel feugiat congue, lacus neque ultricies justo, nec tempus risus dolor nec purus. Fusce velit purus, porttitor ut tincidunt et, rutrum feugiat tortor. In hac habitasse platea dictumst. In mollis, nulla in sodales venenatis, odio lorem pulvinar odio, ut ullamcorper massa leo eu ante. Donec nibh nisi, sodales ac arcu quis, pellentesque pulvinar turpis. Pellentesque commodo mollis lorem, sed porta augue pretium quis.</p>

<p>
  In commodo orci vitae eros consectetur sollicitudin. Sed eu lorem mollis, venenatis odio id, consequat libero. Nunc vestibulum dapibus turpis quis gravida. Integer congue, felis non mattis interdum, nulla dolor vehicula mauris, vel interdum ligula eros ut lacus. Phasellus ultrices tincidunt justo. Vivamus dapibus libero non ultrices placerat. Vestibulum eget orci erat. Mauris quis ante tellus. Fusce vitae neque non augue dictum dictum non a enim. Vivamus congue felis diam, ut suscipit nulla pretium porttitor. Nullam convallis vulputate bibendum. Nullam sem sapien, mollis non augue ut, dapibus congue tellus.
</p>

<p>
  Sed tincidunt, neque sed sollicitudin cursus, nunc augue dictum justo, laoreet ornare ipsum lorem quis arcu. Ut in est justo. Proin pretium id libero non commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer semper turpis ut sapien tincidunt congue. Pellentesque elementum, risus nec sollicitudin dignissim, lacus nisl interdum metus, id vehicula arcu nibh id turpis. Mauris ornare aliquet eleifend. Vestibulum id mi ac turpis condimentum elementum ut vel justo. Pellentesque turpis sem, fermentum et metus vel, tempor sollicitudin lacus. Etiam volutpat pretium orci, quis adipiscing sapien luctus id. Vivamus eu odio tellus.
</p>

<p>
  Donec odio magna, ultricies nec convallis eget, molestie eget odio. Nulla fringilla leo tincidunt sagittis congue. Nam vitae ultrices mauris, id posuere nisi. Nulla vitae enim ipsum. Proin sit amet mi elementum, fermentum felis ac, pellentesque nibh. Maecenas ac mi ante. Mauris nec massa risus. Nulla facilisi. Aenean adipiscing venenatis facilisis. Praesent vitae mattis eros. Sed molestie eros at mi consequat, scelerisque pulvinar mi tempor. Donec eu gravida ante. Sed eu placerat ipsum. Mauris odio tortor, pellentesque sit amet feugiat sit amet, laoreet et turpis. Sed ultricies euismod risus commodo varius.
</p>

<p>Suspendisse pharetra libero lorem. Integer ullamcorper sagittis metus et consectetur. Aliquam quam augue, tempus vel mattis non, sagittis at enim. Maecenas sollicitudin, magna et pellentesque ornare, mi augue imperdiet augue, id semper urna diam et turpis. Aliquam ligula ante, fringilla ac faucibus ac, dignissim quis purus. Duis fermentum porttitor purus, et iaculis enim euismod quis. Sed et dolor diam. Morbi lacinia libero pharetra leo elementum, quis viverra sapien rhoncus. Etiam nec metus nec enim elementum semper. Curabitur tellus ipsum, adipiscing nec commodo eget, rutrum eu tellus. Cras adipiscing odio ac sem cursus, et vehicula odio dignissim. Duis vehicula venenatis magna vel aliquam. Praesent urna nunc, interdum vitae interdum at, luctus et tellus. Donec fermentum augue lorem, eu rhoncus odio interdum nec. Aliquam interdum nisi a orci commodo tincidunt. Duis eleifend dapibus leo, quis ultricies enim interdum eget.</p>"

prefixes = %w[ big little mac dump fast jumbo power ultra ]
suffixes = %w[ truck mobile gretchen smasher hauler loader lifter puller ]

1.upto(20) do |i|
  Truck.create do |truck|
    prefix = prefixes.sample
    suffix = suffixes.sample
    truck.name = prefix.capitalize + ' ' + suffix.capitalize
    truck.slug = [prefix, suffix].join('/')
    truck.description = lipsum
  end
end

rally_suffixes = %w[destruction congregation intersection apocalypse aggregation ragnorokation vacation]
start_dates = (1..3).map{|i| i.days.from_now}
end_dates = (4..7).map{|i| i.days.from_now}
1.upto(20) do |i|
  Rally.create do |rally|
    prefix = prefixes.sample
    suffix = rally_suffixes.sample
    rally.name = prefix.capitalize + ' ' + suffix.capitalize
    rally.slug = [prefix, suffix].join('/')
    rally.start_at = start_dates.sample
    rally.end_at = end_dates.sample
  end
end
