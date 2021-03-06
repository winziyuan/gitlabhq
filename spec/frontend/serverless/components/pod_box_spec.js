import podBoxComponent from '~/serverless/components/pod_box.vue';
import { shallowMount } from '@vue/test-utils';

const createComponent = count =>
  shallowMount(podBoxComponent, {
    propsData: {
      count,
    },
    sync: false,
  }).vm;

describe('podBoxComponent', () => {
  it('should render three boxes', () => {
    const count = 3;
    const vm = createComponent(count);
    const rects = vm.$el.querySelectorAll('rect');

    expect(rects.length).toEqual(3);
    expect(parseInt(rects[2].getAttribute('x'), 10)).toEqual(40);

    vm.$destroy();
  });
});
