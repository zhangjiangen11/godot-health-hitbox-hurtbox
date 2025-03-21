class_name BasicHitScan2DTest extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var mock_hurt_box: BasicHurtBox2D
var hit_scan: BasicHitScan2D
var signals: Object


func before_test() -> void:
	mock_hurt_box = mock(BasicHurtBox2D)
	hit_scan = auto_free(BasicHitScan2D.new())
	add_child(hit_scan)
	signals = monitor_signals(hit_scan)


func test_defaults() -> void:
	var action := HealthAction.new()
	assert_int(hit_scan.actions.size()).is_equal(1)
	assert_object(hit_scan.actions[0]).is_equal(HealthActionMatcher.new(action))


func test_affect() -> void:
	hit_scan.affect = Health.Affect.HEAL

	var action := HealthAction.new(Health.Affect.HEAL, HealthActionType.Enum.MEDICINE)
	assert_int(hit_scan.actions.size()).is_equal(1)
	assert_object(hit_scan.actions[0]).is_equal(HealthActionMatcher.new(action))


func test_amount() -> void:
	hit_scan.amount = 25

	var action := HealthAction.new()
	action.amount = 25
	assert_int(hit_scan.actions.size()).is_equal(1)
	assert_object(hit_scan.actions[0]).is_equal(HealthActionMatcher.new(action))
